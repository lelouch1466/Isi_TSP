import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/constants/modulos_constantes.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/pregunta_opcion.dart';
import 'package:isi_tsp/domain/entities/preguntas.dart';
import 'package:isi_tsp/domain/repositories/pregunta_opcion_repositorio.dart';
import 'package:isi_tsp/domain/repositories/pregunta_repositorio.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';
import 'package:isi_tsp/presentation/components/answer_selector.dart';
import 'package:isi_tsp/presentation/components/result_box.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

//Examen de un modulo: igual que QuestionScreen, pero junta las preguntas
//de todos los pasos del modulo (solo recibe el modulo)
class ExamenScreen extends StatefulWidget {
  //id de la base del modulo
  final int moduloId;

  const ExamenScreen({super.key, required this.moduloId});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  int index = 0;
  bool opcion_tomada = false;
  bool? opcion_correcta1;
  int puntaje = 0;

  //todas las preguntas del modulo que se recibio
  List<Preguntas> listado = [];

  //opciones de cada pregunta, guardadas por preguntaId
  //(texto de la opcion -> true si es la correcta)
  final Map<int, Map<String, bool>> opciones_por_pregunta = {};

  //se pide una sola vez al entrar a la pantalla
  late final Future<void> carga_preguntas;

  //---------------- modo endless ----------------
  //todas las preguntas
  bool get esEndless => widget.moduloId == moduloEndlessId;

  //sube en cada turno; se usa como key de AnswerSelector para que
  //se limpie aunque salga la misma pregunta dos veces seguidas
  int ronda = 0;
  final Random _azar = Random();

  //pregunta sorteada en el turno actual (solo endless)
  Preguntas? preguntaActual;

  //pregunta que se muestra segun el modo
  Preguntas get preguntaMostrada =>
      esEndless ? preguntaActual! : listado[index];

  @override
  void initState() {
    super.initState();
    carga_preguntas = cargarPreguntas();
  }

  //consulta las preguntas y despues las opciones de cada una
  Future<void> cargarPreguntas() async {
    final PreguntaRepositorio repo = GetIt.instance<PreguntaRepositorio>();

    //endless junta las preguntas de todos los modulos
    List<Preguntas> preguntas = esEndless
        ? await repo.obtenerTodasLasPreguntas()
        : await repo.obtenerPreguntasPorModulo(widget.moduloId);

    for (final pregunta in preguntas) {
      final List<PreguntaOpcion> opciones =
          await GetIt.instance<PreguntaOpcionRepositorio>()
              .obtenerOpcionesPorPregunta(pregunta.preguntaId);

      //se convierte la lista de opciones al Map que pide AnswerSelector
      opciones_por_pregunta[pregunta.preguntaId] = {
        for (final opcion in opciones) opcion.respuesta: opcion.esCorrecta,
      };
    }

    //en endless se quitan las preguntas sin opciones para no quedar atorado
    if (esEndless) {
      preguntas = preguntas
          .where((p) => (opciones_por_pregunta[p.preguntaId] ?? {}).isNotEmpty)
          .toList();
    }

    listado = preguntas;

    //la primera pregunta se sortea antes de mostrar la pantalla
    if (esEndless) sortearPregunta();
  }

  //elige una pregunta al azar (se puede repetir) y limpia el turno
  void sortearPregunta() {
    if (listado.isEmpty) return;
    preguntaActual = listado[_azar.nextInt(listado.length)];
    opcion_tomada = false;
    opcion_correcta1 = null;
    ronda++;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //cosas para mostrar si se quiere salir
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        mostrarConfirmacion(context);
      },
      child: Scaffold(
        //barra de app
        appBar: barra_app(),

        //cuerpo de la pantalla
        body: FutureBuilder<void>(
          future: carga_preguntas,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error al cargar preguntas: ${snapshot.error}"),
              );
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (listado.isEmpty) {
              return Center(
                child: Text(
                  esEndless
                      ? "No hay preguntas disponibles"
                      : "Este modulo no tiene preguntas",
                ),
              );
            }

            return Column(
              children: [
                //el titulo de la pregunta
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    preguntaMostrada.titulo,
                    style: TextStyles.pregunta,
                  ),
                ),

                //la linea abajo de la pregunta
                const Divider(),

                //widget de las opciones de la pregunta actual
                AnswerSelector(
                  //key distinta en cada turno: se crea de nuevo, mezcla las
                  //opciones y no deja marcada la respuesta anterior
                  key: ValueKey(ronda),
                  lista_opciones:
                      opciones_por_pregunta[preguntaMostrada.preguntaId] ?? {},
                  tomar_opcion: (valor_opcion) {
                    setState(() {
                      opcion_tomada = true;
                      opcion_correcta1 = valor_opcion;
                    });
                  },
                ),
              ],
            );
          },
        ),

        //Boton de siguiente (solo cuando ya hay preguntas)
        floatingActionButton: FutureBuilder<void>(
          future: carga_preguntas,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done ||
                listado.isEmpty) {
              return const SizedBox.shrink();
            }
            return nextButon(listado.length);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  //===============================*======================================
  //===============================*======================================
  AppBar barra_app() {
    return AppBar(
      backgroundColor: Appcolors.barraap,
      title: Text(
        esEndless ? "Endless" : "Examen",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsGeometry.all(18),
          child: Text(
            esEndless ? "Racha: $puntaje" : "Puntaje: $puntaje",
            style: TextStyles.bold,
          ),
        ),
      ],
    );
  }

  //cosas con el boton de siguiente
  GestureDetector nextButon(int numero_preguntas) {
    return GestureDetector(
      //logica
      onTap: () {
        //endless tiene su propia logica
        if (esEndless) {
          siguienteEndless();
          return;
        }

        setState(() {
          //si el index es menor y tiene opcion tomada
          if (index < numero_preguntas - 1 && opcion_tomada) {
            index++;
            if (opcion_correcta1!) {
              puntaje++;
            }
            opcion_tomada = false;
            //si el index es igual al numero de preguntas y tiene opcion tomada
          } else if (index == numero_preguntas - 1 && opcion_tomada) {
            if (opcion_correcta1!) {
              puntaje++;
            }

            //se guarda el puntaje del examen (solo si es mayor)
            guardarPuntajeExamen();

            //pantalla de resultado
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => ResultBox(
                puntaje_final: puntaje,
                total_preguntas: numero_preguntas,
                //en el examen no hay mapa al cual regresar
                mostrar_regresar: false,
                reinicio: () {
                  boton_reinicio();
                },
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("selecciona una opcion"),
                behavior: SnackBarBehavior.floating,
                //margin: EdgeInsets.symmetric(vertical: 70),
              ),
            );
          }
        });
      },
      //cosas visuales
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Appcolors.primario,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Siguiente",
          textAlign: TextAlign.center,
          style: TextStyles.bold,
        ),
      ),
    );
  }

  //Siguiente en endless: correcta suma y sortea otra, incorrecta termina
  void siguienteEndless() {
    if (!opcion_tomada || opcion_correcta1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("selecciona una opcion"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (opcion_correcta1!) {
      setState(() {
        puntaje++;
        sortearPregunta();
      });
    } else {
      mostrarResultadoEndless();
    }
  }

  //guarda el puntaje del examen de este modulo; la BD solo lo
  //sobrescribe si es mayor que el guardado
  void guardarPuntajeExamen() {
    GetIt.instance<PuntajeRepositorio>().actualizarPuntajeExamen(
      widget.moduloId,
      puntaje,
    );
  }

  //fin de la partida endless: muestra la racha
  void mostrarResultadoEndless() {
    //la racha se guarda como puntaje del examen de endless (solo si es mayor)
    guardarPuntajeExamen();

    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => ResultBox(
        puntaje_final: puntaje,
        //se ignora en endless; 1 evita dividir entre cero
        total_preguntas: 1,
        es_endless: true,
        mostrar_regresar: false,
        reinicio: boton_reinicio,
      ),
    );
  }

  void boton_reinicio() {
    setState(() {
      index = 0;
      opcion_tomada = false;
      opcion_correcta1 = null;
      puntaje = 0;
      //endless empieza con otra pregunta al azar; normal vuelve a la primera
      if (esEndless) {
        sortearPregunta();
      } else {
        ronda++;
      }
    });
    Navigator.pop(context);
  }

  //confirmacion de salida
  void mostrarConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¿Deseas salir?"),
        content: const Text("Tu progreso no se guardará."),
        actions: [
          // Permanecer en el examen
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),

          // Abandonar el cuestionario
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cierra el AlertDialog
              Navigator.pop(this.context); // Sale del examen
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
