import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/pregunta_opcion.dart';
import 'package:isi_tsp/domain/entities/preguntas.dart';
import 'package:isi_tsp/domain/repositories/pregunta_opcion_repositorio.dart';
import 'package:isi_tsp/domain/repositories/pregunta_repositorio.dart';
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

  @override
  void initState() {
    super.initState();
    carga_preguntas = cargarPreguntas();
  }

  //consulta las preguntas y despues las opciones de cada una
  Future<void> cargarPreguntas() async {
    final List<Preguntas> preguntas =
        await GetIt.instance<PreguntaRepositorio>().obtenerPreguntasPorModulo(
          widget.moduloId,
        );

    for (final pregunta in preguntas) {
      final List<PreguntaOpcion> opciones =
          await GetIt.instance<PreguntaOpcionRepositorio>()
              .obtenerOpcionesPorPregunta(pregunta.preguntaId);

      //se convierte la lista de opciones al Map que pide AnswerSelector
      opciones_por_pregunta[pregunta.preguntaId] = {
        for (final opcion in opciones) opcion.respuesta: opcion.esCorrecta,
      };
    }

    listado = preguntas;
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
              return const Center(
                child: Text("Este modulo no tiene preguntas"),
              );
            }

            return Column(
              children: [
                //el titulo de la pregunta
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    listado[index].titulo,
                    style: TextStyles.pregunta,
                  ),
                ),

                //la linea abajo de la pregunta
                const Divider(),

                //widget de las opciones de la pregunta actual
                AnswerSelector(
                  //el mismo Map de cada pregunta se reutiliza, asi
                  //AnswerSelector solo vuelve a mezclar al cambiar de pregunta
                  lista_opciones:
                      opciones_por_pregunta[listado[index].preguntaId] ?? {},
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
      title: Text("Examen", style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsetsGeometry.all(18),
          child: Text("Puntaje: $puntaje", style: TextStyles.bold),
        ),
      ],
    );
  }

  //cosas con el boton de siguiente
  GestureDetector nextButon(int numero_preguntas) {
    return GestureDetector(
      //logica
      onTap: () {
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

  void boton_reinicio() {
    setState(() {
      index = 0;
      opcion_tomada = false;
      opcion_correcta1;
      puntaje = 0;
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
