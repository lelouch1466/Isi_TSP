import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:isi_tsp/data/database/datos_iniciales.dart';

part 'app_database.g.dart';

// ===================== TABLAS =====================

@DataClassName('ModuloData')
class Modulos extends Table {
  IntColumn get idModulo => integer().autoIncrement()();
  TextColumn get nombre => text()();
  //texto corto que resume el modulo
  TextColumn get descripcion => text().withDefault(const Constant(''))();
  BoolColumn get bloqueado => boolean().withDefault(const Constant(true))();
}

@DataClassName('PasoData')
class Pasos extends Table {
  IntColumn get idPaso => integer().autoIncrement()();
  IntColumn get idModulo => integer().references(Modulos, #idModulo)();
  //orden del paso dentro de su modulo (1, 2, 3...)
  IntColumn get numero => integer()();
  TextColumn get nombreLeccion => text()();
  BoolColumn get bloqueado => boolean().withDefault(const Constant(true))();
  TextColumn get tipoContenido => text()();
}

@DataClassName('PreguntaData')
class Preguntas extends Table {
  IntColumn get idPregunta => integer().autoIncrement()();
  IntColumn get idModulo => integer().references(Modulos, #idModulo)();
  IntColumn get idPaso => integer().references(Pasos, #idPaso)();
  TextColumn get titulo => text()();
}

@DataClassName('PreguntaOpcionData')
class PreguntaOpciones extends Table {
  IntColumn get idOpcion => integer().autoIncrement()();
  IntColumn get idPregunta => integer().references(Preguntas, #idPregunta)();
  IntColumn get idModulo => integer().references(Modulos, #idModulo)();
  IntColumn get idPaso => integer().references(Pasos, #idPaso)();
  TextColumn get respuesta => text()();
  BoolColumn get valor => boolean().withDefault(const Constant(false))();
}

@DataClassName('TeoriaData')
class Teorias extends Table {
  IntColumn get idTeoria => integer().autoIncrement()();
  IntColumn get idModulo => integer().references(Modulos, #idModulo)();
  IntColumn get idPaso => integer().references(Pasos, #idPaso)();
  //orden de la pagina dentro del paso (1, 2, 3...)
  IntColumn get pagina => integer().withDefault(const Constant(1))();
  TextColumn get escrito => text()();
}

@DataClassName('PuntajeData')
class Puntajes extends Table {
  IntColumn get idPuntaje => integer().autoIncrement()();
  IntColumn get idModulo => integer().references(Modulos, #idModulo)();
  IntColumn get idPaso => integer().references(Pasos, #idPaso)();
  IntColumn get puntaje => integer().withDefault(const Constant(0))();
}

@DataClassName('GlosarioData')
class Glosarios extends Table {
  IntColumn get idGlosario => integer().autoIncrement()();
  TextColumn get termino => text()();
  TextColumn get descripcion => text()();
}

// ===================== BASE DE DATOS =====================

@DriftDatabase(
  tables: [
    Modulos,
    Pasos,
    Preguntas,
    PreguntaOpciones,
    Teorias,
    Puntajes,
    Glosarios,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'isi_tsp'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // Solo corre la PRIMERA vez que se crea el archivo de la base
    onCreate: (m) async {
      await m.createAll(); // primero crea las tablas
      await _insertarDatosIniciales();

      // Durante onCreate las FK todavia no se revisan (el PRAGMA se activa
      // en beforeOpen), asi que se verifican a mano. Solo corre en debug.
      final errores = await customSelect('PRAGMA foreign_key_check').get();
      assert(
        errores.isEmpty,
        'Datos iniciales con FK invalidas: ${errores.map((e) => e.data)}',
      );
    },
    // Activa las claves foraneas en SQLite cada vez que se abre
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  //===============================*======================================
  // ===================== DATOS INICIALES =====================
  //===============================*======================================
  //datos que vienen precargados con la app
  Future<void> _insertarDatosIniciales() async {
    //los 3 modulos escritos uno por uno e insertados juntos
    await batch((b) {
      b.insertAll(modulos, [
        ModulosCompanion.insert(
          nombre: 'papas y cebollas',
          bloqueado: const Value(false), //el primero empieza desbloqueado
        ),
        ModulosCompanion.insert(
          nombre: 'Procesos y metodologías de desarrollo',
        ),
        ModulosCompanion.insert(nombre: 'Requisitos, diseño y pruebas'),
      ]);
    });

    //el batch no devuelve ids, asi que se leen los modulos de vuelta
    //(ordenados por id) para usar el id real que les asigno SQLite
    final List<ModuloData> listaModulos = await obtenerModulos();

    for (int i = 0; i < listaModulos.length; i++) {
      final int numeroModulo = i + 1;
      final int idModulo = listaModulos[i].idModulo;

      //6 pasos por modulo: impares = teoria, pares = cuestionario
      for (int numeroPaso = 1; numeroPaso <= 6; numeroPaso++) {
        final bool esCuestionario = numeroPaso.isEven;

        final int idPaso = await into(pasos).insert(
          PasosCompanion.insert(
            idModulo: idModulo,
            numero: numeroPaso,
            nombreLeccion:
                'Mdl${numeroModulo}P$numeroPaso${esCuestionario ? 'C' : 'T'}',
            bloqueado: Value(numeroPaso != 1),
            tipoContenido: esCuestionario ? 'cuestionario' : 'teoria',
          ),
        );

        //los pasos de teoria llevan sus paginas de teoria y no tienen preguntas
        if (!esCuestionario) {
          final paginasDelPaso =
              teoriasIniciales[numeroModulo]?[numeroPaso] ?? const <String>[];

          // cada texto es una pagina: comparten idModulo e idPaso,
          // y la pagina va 1, 2, 3... segun su posicion en la lista
          await batch((b) {
            b.insertAll(teorias, [
              for (int p = 0; p < paginasDelPaso.length; p++)
                TeoriasCompanion.insert(
                  idModulo: idModulo,
                  idPaso: idPaso,
                  pagina: Value(p + 1),
                  escrito: paginasDelPaso[p],
                ),
            ]);
          });
          continue;
        }

        final preguntasDelPaso =
            preguntasIniciales[numeroModulo]?[numeroPaso] ?? const [];

        for (final pregunta in preguntasDelPaso) {
          // la pregunta usa el id real del modulo y del paso
          final int idPregunta = await into(preguntas).insert(
            PreguntasCompanion.insert(
              idModulo: idModulo,
              idPaso: idPaso,
              titulo: pregunta.titulo,
            ),
          );

          // 4 opciones: 1 correcta (valor = true) y 3 incorrectas (false)
          await batch((b) {
            b.insertAll(preguntaOpciones, [
              PreguntaOpcionesCompanion.insert(
                idPregunta: idPregunta,
                idModulo: idModulo,
                idPaso: idPaso,
                respuesta: pregunta.correcta,
                valor: const Value(true),
              ),
              for (final incorrecta in pregunta.incorrectas)
                PreguntaOpcionesCompanion.insert(
                  idPregunta: idPregunta,
                  idModulo: idModulo,
                  idPaso: idPaso,
                  respuesta: incorrecta,
                  //valor no se pone: por defecto es false
                ),
            ]);
          });
        }
      }
    }

    //modulo 4 "endless": se inserta aparte porque no sigue el patron
    //de 6 pasos. Empieza bloqueado; se desbloquea al completar el ultimo
    //paso del modulo 3 (lo hace DesbloquearSiguiente, que pasa al
    //siguiente modulo por orden de id)
    final int idModuloEndless = await into(modulos).insert(
      ModulosCompanion.insert(
        nombre: 'endless',
        //bloqueado no se pone: por defecto es true
      ),
    );

    //su unico paso: cuestionario y ya desbloqueado
    await into(pasos).insert(
      PasosCompanion.insert(
        idModulo: idModuloEndless,
        numero: 1,
        nombreLeccion: 'M4p1c',
        bloqueado: const Value(false),
        tipoContenido: 'cuestionario',
      ),
    );
  }
  //===============================*======================================
  // ===================== CONSULTAS =====================
  //===============================*======================================

  //lee todos los modulos ordenados por id
  Future<List<ModuloData>> obtenerModulos() => (select(
    modulos,
  )..orderBy([(t) => OrderingTerm(expression: t.idModulo)])).get();

  //igual que obtenerModulos, pero emite una lista nueva
  //cada vez que cambia la tabla de modulos
  Stream<List<ModuloData>> observarModulos() => (select(
    modulos,
  )..orderBy([(t) => OrderingTerm(expression: t.idModulo)])).watch();

  //pone bloqueado = false al modulo con ese id
  Future<void> desbloquearModulo(int id) async {
    await (update(modulos)..where((t) => t.idModulo.equals(id))).write(
      const ModulosCompanion(bloqueado: Value(false)),
    );
  }

  //dice si el modulo que sigue (el de id mayor mas cercano) esta bloqueado
  //devuelve null si no hay un siguiente modulo
  Future<bool?> siguienteModuloBloqueado(int idModulo) async {
    final ModuloData? siguiente =
        await (select(modulos)
              ..where((t) => t.idModulo.isBiggerThanValue(idModulo))
              ..orderBy([(t) => OrderingTerm(expression: t.idModulo)])
              ..limit(1))
            .getSingleOrNull();
    return siguiente?.bloqueado;
  }

  //lee los pasos de un modulo, ordenados por su numero (1, 2, 3...)
  Future<List<PasoData>> obtenerPasosPorModulo(int idModulo) =>
      (select(pasos)
            ..where((t) => t.idModulo.equals(idModulo))
            ..orderBy([(t) => OrderingTerm(expression: t.numero)]))
          .get();

  //igual que obtenerPasosPorModulo, pero emite una lista nueva
  //cada vez que cambia la tabla de pasos (por ejemplo al desbloquear uno)
  Stream<List<PasoData>> observarPasosPorModulo(int idModulo) =>
      (select(pasos)
            ..where((t) => t.idModulo.equals(idModulo))
            ..orderBy([(t) => OrderingTerm(expression: t.numero)]))
          .watch();

  //pone bloqueado = false al paso con ese id
  Future<void> desbloquearPaso(int id) async {
    await (update(pasos)..where((t) => t.idPaso.equals(id))).write(
      const PasosCompanion(bloqueado: Value(false)),
    );
  }

  //lee las preguntas de un modulo y paso, ordenadas por id
  Future<List<PreguntaData>> obtenerPreguntasPorModuloYPaso(
    int idModulo,
    int idPaso,
  ) =>
      (select(preguntas)
            ..where(
              (t) => t.idModulo.equals(idModulo) & t.idPaso.equals(idPaso),
            )
            ..orderBy([(t) => OrderingTerm(expression: t.idPregunta)]))
          .get();

  //lee todas las preguntas de un modulo (de todos sus pasos),
  //ordenadas por paso y despues por id
  Future<List<PreguntaData>> obtenerPreguntasPorModulo(int idModulo) =>
      (select(preguntas)
            ..where((t) => t.idModulo.equals(idModulo))
            ..orderBy([
              (t) => OrderingTerm(expression: t.idPaso),
              (t) => OrderingTerm(expression: t.idPregunta),
            ]))
          .get();

  //lee las opciones de una pregunta, ordenadas por id
  Future<List<PreguntaOpcionData>> obtenerOpcionesPorPregunta(int idPregunta) =>
      (select(preguntaOpciones)
            ..where((t) => t.idPregunta.equals(idPregunta))
            ..orderBy([(t) => OrderingTerm(expression: t.idOpcion)]))
          .get();

  //lee las paginas de teoria de un modulo y paso, ordenadas por pagina
  Future<List<TeoriaData>> obtenerTeoriasPorModuloYPaso(
    int idModulo,
    int idPaso,
  ) =>
      (select(teorias)
            ..where(
              (t) => t.idModulo.equals(idModulo) & t.idPaso.equals(idPaso),
            )
            ..orderBy([(t) => OrderingTerm(expression: t.pagina)]))
          .get();
}

// Instancia unica de la base para toda la app.
// Las variables globales en Dart se crean la primera vez que se usan.
final AppDatabase baseDatos = AppDatabase();
