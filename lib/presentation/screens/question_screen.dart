import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/question.dart';
import 'package:isi_tsp/presentation/components/answer_selector.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  bool opcion_tomada = false;
  bool? opcion_correcta1;
  int puntaje = 0;

  @override
  Widget build(BuildContext context) {
    List<Question> listado = iniciar_cuestionario();

    return Scaffold(
      //barra de app
      appBar: barra_app(),

      //cuerpo de la pantalla
      body: Column(
        children: [

          //el titulo de la pregunta
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "El index es ${index.toString()} y la pregunta es ${listado[index].titulo}",
            ),
          ),

          //la linea abajo de la pregunta
          const Divider(),

          //widget de las preguntas
          AnswerSelector(
            lista_opciones: listado[index].opciones,
            tomar_opcion: (valor_opcion) {
              setState(() {
                opcion_tomada = true;
                if (valor_opcion) {
                  opcion_correcta1 = valor_opcion;
                } else {
                  opcion_correcta1 = false;
                }
                ;
              });
            },
            /*
            seleccionado: opcion_seleccionado,
            cambio_seleccion: () {
              setState(() {
                ultima_seleccion = opcion_seleccionado;
              });
            },*/
          ),
        ],
      ),

      //Boton de siguiente
      floatingActionButton: nextButon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  //===============================*======================================
  //===============================*======================================
  AppBar barra_app() {
    return AppBar(
      backgroundColor: Appcolors.barraap,
      title: Text(
        "Cuestionario",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsGeometry.all(18),
          child: Text("Puntaje: $puntaje", style: TextStyles.bold),
        ),
      ],
    );
  }

  //cosas con el boton de siguiente
  GestureDetector nextButon() {
    return GestureDetector(
      //logica
      onTap: () {
        setState(() {
          //si el index es menor y tiene opcion tomada
          if (index < 1 && opcion_tomada) {
            index++;
            if (opcion_correcta1!) {
              puntaje++;
            }
            opcion_tomada = false;
            //si el index es igual al numero de preguntas y tiene opcion tomada
          //}else if{
              

          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("selecciona una opcion"),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(vertical: 70),
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

  //inicializacion de un cuestionario
  List<Question> iniciar_cuestionario() {
    List<Question> listado = [
      Question(
        preguntaId: "1",
        titulo: "cuanto es 1+1",
        opciones: {'1': false, '2': true, '3': false, '4': false},
      ),
      Question(
        preguntaId: "2",
        titulo: "cuanto es 10+10",
        opciones: {'10': false, '20': true, '30': false, '40': false},
      ),
    ];

    return listado;
  }
}

/*
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Text("Cuanto es 1+1?"),
            //aqui se ponen los componentes
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    
                  },
                );
              },
            ),
          ],
        ),
      ),
*/
