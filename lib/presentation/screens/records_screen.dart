import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/constants/modulos_constantes.dart';
import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';
import 'package:isi_tsp/domain/entities/rango.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';
import 'package:isi_tsp/domain/usecases/calcular_rango.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/components/tarjeta_rango.dart';
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

  //rango del jugador segun la suma de todos sus puntajes
  late RangoJugador rangoJugador;

  //se pide una sola vez al entrar a la pantalla
  late final Future<void> carga_records;

  @override
  void initState() {
    super.initState();
    carga_records = cargarRecords();
  }

  Future<void> cargarRecords() async {
    final PuntajeRepositorio repo = GetIt.instance<PuntajeRepositorio>();

    puntajes_cuestionario = await repo.obtenerPuntajes();
    puntajes_examen = await repo.obtenerPuntajesExamen();

    //la suma y el rango los calcula el caso de uso (regla de domain)
    rangoJugador = await GetIt.instance<CalcularRango>()();
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

          return Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //---------------- rango ----------------
                  TarjetaRango(rangoJugador: rangoJugador),

                  const SizedBox(height: 30),

                  //---------------- cuestionarios ----------------
                  titulo_tabla("Cuestionarios"),
                  tabla(
                    columnas: const ["Cuestionario", "Puntaje"],
                    filas: [
                      for (final p in puntajes_cuestionario)
                        [p.nombreLeccion, "${p.puntaje}"],
                    ],
                    //linea gruesa donde empieza cada modulo
                    filasNuevoModulo: filasNuevoModulo(puntajes_cuestionario),
                  ),

                  const SizedBox(height: 30),

                  //---------------- examenes ----------------
                  titulo_tabla("Examenes"),
                  tabla(
                    columnas: const ["Modulo", "Puntaje"],
                    filas: [
                      for (final e in examenes)
                        [e.nombreModulo, "${e.puntaje}"],
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

  //posiciones de las filas donde cambia el modulo (la primera no cuenta).
  //los puntajes ya vienen ordenados por modulo y paso
  Set<int> filasNuevoModulo(List<Puntajes> puntajes) {
    return {
      for (int i = 1; i < puntajes.length; i++)
        if (puntajes[i].moduloId != puntajes[i - 1].moduloId) i,
    };
  }

  //===============================*======================================
  //tabla generica: una lista de columnas y una lista de filas de texto.
  //filasNuevoModulo: filas que llevan una linea gruesa arriba para separar
  //visualmente un modulo del siguiente
  Widget tabla({
    required List<String> columnas,
    required List<List<String>> filas,
    Set<int> filasNuevoModulo = const {},
  }) {
    if (filas.isEmpty) {
      return const Text("Sin registros");
    }

    //se usa Table (y no DataTable) porque Table deja poner un borde
    //distinto a cada fila; DataTable usa el mismo grosor para todas
    return Table(
      border: TableBorder.all(color: Colors.grey.shade400),
      //la primera columna ocupa el espacio que sobra (los nombres largos
      //bajan de renglon); las demas miden lo que mida su texto
      columnWidths: const {0: FlexColumnWidth()},
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        //encabezado azul
        TableRow(
          decoration: const BoxDecoration(color: Appcolors.barraap),
          children: [
            for (final columna in columnas)
              celda(
                columna,
                estilo: const TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),

        //---------------------*----------------------------
        for (int i = 0; i < filas.length; i++)
          TableRow(
            //linea gris oscura y gruesa arriba de la fila si empieza otro modulo
            decoration: filasNuevoModulo.contains(i)
                ? BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade800, width: 4),
                    ),
                  )
                : null,
            children: [for (final texto in filas[i]) celda(texto)],
          ),
      ],
    );
  }

  //una celda de la tabla con su espacio alrededor
  Widget celda(String texto, {TextStyle? estilo}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(texto, style: estilo),
    );
  }
}
