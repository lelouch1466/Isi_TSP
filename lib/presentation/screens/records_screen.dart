import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/constants/modulos_constantes.dart';
import 'package:isi_tsp/domain/entities/modulos.dart';
import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

//Pantalla con los mejores puntajes guardados:
//cuestionarios, examenes y la racha de endless
class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  List<Puntajes> puntajes_cuestionario = [];
  List<PuntajesExamen> puntajes_examen = [];

  //nombre de cada modulo por su id (para la tabla de cuestionarios)
  final Map<int, String> nombres_modulos = {};

  //se pide una sola vez al entrar a la pantalla
  late final Future<void> carga_records;

  @override
  void initState() {
    super.initState();
    carga_records = cargarRecords();
  }

  Future<void> cargarRecords() async {
    final PuntajeRepositorio repo = GetIt.instance<PuntajeRepositorio>();

    final List<Modulos> modulos = await GetIt.instance<ModulosRepositorio>()
        .obtenerModulos();
    for (final modulo in modulos) {
      nombres_modulos[modulo.moduloId] = modulo.nombre;
    }

    puntajes_cuestionario = await repo.obtenerPuntajes();
    puntajes_examen = await repo.obtenerPuntajesExamen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraApp.barrita("Records"),
      body: FutureBuilder<void>(
        future: carga_records,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar records: ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          //endless va en su propia tabla; el resto son examenes normales
          final List<PuntajesExamen> examenes = puntajes_examen
              .where((e) => e.moduloId != moduloEndlessId)
              .toList();
          final List<PuntajesExamen> endless = puntajes_examen
              .where((e) => e.moduloId == moduloEndlessId)
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //---------------- cuestionarios ----------------
                titulo_tabla("Cuestionarios"),
                tabla(
                  columnas: const ["Modulo", "Cuestionario", "Puntaje"],
                  filas: [
                    for (final p in puntajes_cuestionario)
                      [
                        nombres_modulos[p.moduloId] ?? "${p.moduloId}",
                        p.nombreLeccion,
                        "${p.puntaje}",
                      ],
                  ],
                ),

                const SizedBox(height: 30),

                //---------------- examenes ----------------
                titulo_tabla("Examenes"),
                tabla(
                  columnas: const ["Modulo", "Examen", "Puntaje"],
                  filas: [
                    for (final e in examenes)
                      [e.nombreModulo, "Examen", "${e.puntaje}"],
                  ],
                ),

                const SizedBox(height: 30),

                //---------------- endless ----------------
                titulo_tabla("Endless"),
                tabla(
                  columnas: const ["Endless", "Puntaje"],
                  filas: [
                    for (final e in endless) [e.nombreModulo, "${e.puntaje}"],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //titulo arriba de cada tabla
  Widget titulo_tabla(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  //tabla generica: una lista de columnas y una lista de filas de texto
  Widget tabla({
    required List<String> columnas,
    required List<List<String>> filas,
  }) {
    if (filas.isEmpty) {
      return const Text("Sin registros");
    }

    //scroll horizontal por si los nombres son largos
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Appcolors.barraap),
        border: TableBorder.all(color: Colors.grey.shade400),
        columns: [
          for (final columna in columnas)
            DataColumn(
              label: Text(
                columna,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
        rows: [
          for (final fila in filas)
            DataRow(cells: [for (final celda in fila) DataCell(Text(celda))]),
        ],
      ),
    );
  }
}