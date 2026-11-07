import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/question.dart';
import 'package:isi_tsp/presentation/components/answer_selector.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/components/result_box.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class QuestionScreen extends StatefulWidget {
  /// Módulo del cuestionario: 1, 2 o 3.
  final int modulo;

  const QuestionScreen({super.key, this.modulo = 1});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  bool opcion_tomada = false;
  bool? opcion_correcta1;
  int puntaje = 0;
  late final List<Question> listado;

  @override
  void initState() {
    super.initState();
    listado = iniciar_cuestionario(widget.modulo);
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
        body: Column(
          children: [
            //el titulo de la pregunta
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(listado[index].titulo, style: TextStyles.pregunta),
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
        floatingActionButton: nextButon(listado.length),
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

  //inicializacion de un cuestionario
  //recibe el modulo (1, 2 o 3) y devuelve las 10 preguntas de ese modulo
  List<Question> iniciar_cuestionario(int modulo) {
    switch (modulo) {
      case 2:
        return _modulo2();
      case 3:
        return _modulo3();
      case 1:
      default:
        return _modulo1();
    }
  }

  //modulo 1: fundamentos de la ingenieria de software
  List<Question> _modulo1() {
    return [
      Question(
        preguntaId: "1-1",
        titulo: "¿Qué es la ingeniería de software?",
        opciones: {
          'Aplicar un enfoque sistemático y disciplinado al desarrollo de software':
              true,
          'Solo escribir código lo más rápido posible': false,
          'Reparar computadoras': false,
          'Diseñar páginas web únicamente': false,
        },
      ),
      Question(
        preguntaId: "1-2",
        titulo: "¿En qué año se acuñó el término \"ingeniería de software\"?",
        opciones: {'1968': true, '1995': false, '1950': false, '2005': false},
      ),
      Question(
        preguntaId: "1-3",
        titulo: "¿Qué fue la \"crisis del software\"?",
        opciones: {
          'Proyectos con retrasos, sobrecostos y baja calidad': true,
          'Falta de computadoras en las empresas': false,
          'Un virus informático masivo': false,
          'La caída de precio del hardware': false,
        },
      ),
      Question(
        preguntaId: "1-4",
        titulo: "¿Cuál de estos es un atributo de calidad del software?",
        opciones: {
          'Mantenibilidad': true,
          'Color de la interfaz': false,
          'Cantidad de líneas de código': false,
          'Marca del equipo': false,
        },
      ),
      Question(
        preguntaId: "1-5",
        titulo: "¿Qué diferencia al software de un producto físico?",
        opciones: {
          'Es intangible y no se desgasta por el uso': true,
          'Se desgasta con el tiempo como una máquina': false,
          'Siempre es más barato de producir': false,
          'No necesita mantenimiento': false,
        },
      ),
      Question(
        preguntaId: "1-6",
        titulo: "¿Qué es el mantenimiento de software?",
        opciones: {
          'Modificar el software después de su entrega para corregir o mejorar':
              true,
          'Limpiar físicamente el equipo': false,
          'Escribir la documentación inicial': false,
          'Comprar nuevas licencias': false,
        },
      ),
      Question(
        preguntaId: "1-7",
        titulo: "¿Quién es un stakeholder en un proyecto de software?",
        opciones: {
          'Cualquier persona interesada o afectada por el proyecto': true,
          'Solo el programador principal': false,
          'Únicamente el cliente que paga': false,
          'El sistema operativo': false,
        },
      ),
      Question(
        preguntaId: "1-8",
        titulo: "¿Cuál es un ejemplo de software de sistema?",
        opciones: {
          'Un sistema operativo': true,
          'Un videojuego': false,
          'Una hoja de cálculo': false,
          'Un editor de fotos': false,
        },
      ),
      Question(
        preguntaId: "1-9",
        titulo: "¿Qué es un ingeniero de software?",
        opciones: {
          'Profesional que aplica principios de ingeniería para construir software':
              true,
          'Persona que solo instala programas': false,
          'Técnico que repara redes': false,
          'Persona que solo prueba hardware': false,
        },
      ),
      Question(
        preguntaId: "1-10",
        titulo: "¿Cuál de estos es un principio ético de la profesión?",
        opciones: {
          'Respetar la confidencialidad de la información del cliente': true,
          'Copiar código sin licencia': false,
          'Ocultar errores conocidos al cliente': false,
          'Entregar el producto sin pruebas': false,
        },
      ),
    ];
  }

  //modulo 2: procesos y metodologias de desarrollo
  List<Question> _modulo2() {
    return [
      Question(
        preguntaId: "2-1",
        titulo: "¿Qué es el ciclo de vida del software?",
        opciones: {
          'Las etapas por las que pasa un software desde su idea hasta su retiro':
              true,
          'El tiempo que dura la batería del equipo': false,
          'La vida laboral de un programador': false,
          'El número de usuarios activos': false,
        },
      ),
      Question(
        preguntaId: "2-2",
        titulo: "¿Cómo se caracteriza el modelo en cascada?",
        opciones: {
          'Etapas secuenciales donde cada una inicia al terminar la anterior':
              true,
          'Entregas pequeñas y continuas cada semana': false,
          'No tiene fases definidas': false,
          'Se programa antes de analizar': false,
        },
      ),
      Question(
        preguntaId: "2-3",
        titulo: "¿Qué es una metodología ágil?",
        opciones: {
          'Un enfoque iterativo que valora la adaptación al cambio': true,
          'Un modelo sin comunicación con el cliente': false,
          'Un método que exige documentación extensa antes de programar': false,
          'Un lenguaje de programación': false,
        },
      ),
      Question(
        preguntaId: "2-4",
        titulo: "En Scrum, ¿cómo se llama cada iteración de trabajo?",
        opciones: {
          'Sprint': true,
          'Release': false,
          'Backlog': false,
          'Commit': false,
        },
      ),
      Question(
        preguntaId: "2-5",
        titulo: "En Scrum, ¿quién prioriza el Product Backlog?",
        opciones: {
          'El Product Owner': true,
          'El Scrum Master': false,
          'El cliente final directamente': false,
          'El tester': false,
        },
      ),
      Question(
        preguntaId: "2-6",
        titulo: "¿Qué es el modelo incremental?",
        opciones: {
          'Se entrega el software en partes funcionales sucesivas': true,
          'Se entrega todo el software al final sin avances': false,
          'Se repite el mismo código varias veces': false,
          'Solo se hacen pruebas': false,
        },
      ),
      Question(
        preguntaId: "2-7",
        titulo: "¿Qué caracteriza al modelo en espiral?",
        opciones: {
          'Incorpora el análisis de riesgos en cada vuelta': true,
          'No considera los riesgos': false,
          'Tiene una única fase': false,
          'Elimina la planificación': false,
        },
      ),
      Question(
        preguntaId: "2-8",
        titulo: "¿Qué es Kanban?",
        opciones: {
          'Un método visual para gestionar el flujo de trabajo con tablero':
              true,
          'Un lenguaje de modelado': false,
          'Una herramienta de compilación': false,
          'Un tipo de prueba de software': false,
        },
      ),
      Question(
        preguntaId: "2-9",
        titulo: "¿Qué es un prototipo?",
        opciones: {
          'Una versión preliminar para validar ideas o requisitos': true,
          'El producto final ya entregado': false,
          'Un manual de usuario': false,
          'Un tipo de base de datos': false,
        },
      ),
      Question(
        preguntaId: "2-10",
        titulo: "¿Para qué sirve un sistema de control de versiones como Git?",
        opciones: {
          'Para registrar y gestionar los cambios del código a lo largo del tiempo':
              true,
          'Para diseñar la interfaz gráfica': false,
          'Para compilar a código máquina': false,
          'Para acelerar el internet': false,
        },
      ),
    ];
  }

  //modulo 3: requisitos, diseno y pruebas
  List<Question> _modulo3() {
    return [
      Question(
        preguntaId: "3-1",
        titulo: "¿Qué es un requisito funcional?",
        opciones: {
          'Describe lo que el sistema debe hacer': true,
          'Describe el color de la pantalla': false,
          'Indica el costo del hardware': false,
          'Define el horario del equipo': false,
        },
      ),
      Question(
        preguntaId: "3-2",
        titulo: "¿Cuál es un ejemplo de requisito no funcional?",
        opciones: {
          'El sistema debe responder en menos de 2 segundos': true,
          'El usuario puede registrarse': false,
          'El sistema permite iniciar sesión': false,
          'El usuario puede editar su perfil': false,
        },
      ),
      Question(
        preguntaId: "3-3",
        titulo: "¿Qué es una historia de usuario?",
        opciones: {
          'Una descripción breve de una funcionalidad desde la perspectiva del usuario':
              true,
          'Un diagrama de base de datos': false,
          'Un informe de errores': false,
          'Un contrato legal': false,
        },
      ),
      Question(
        preguntaId: "3-4",
        titulo: "¿Qué representa un diagrama de casos de uso en UML?",
        opciones: {
          'La interacción entre los actores y el sistema': true,
          'La estructura interna de la memoria': false,
          'El flujo de la red': false,
          'El código fuente completo': false,
        },
      ),
      Question(
        preguntaId: "3-5",
        titulo: "¿Qué muestra un diagrama de clases?",
        opciones: {
          'Las clases, sus atributos, métodos y relaciones': true,
          'Los tiempos de entrega': false,
          'El presupuesto del proyecto': false,
          'Los usuarios conectados': false,
        },
      ),
      Question(
        preguntaId: "3-6",
        titulo: "¿Qué busca el principio de bajo acoplamiento y alta cohesión?",
        opciones: {
          'Módulos independientes entre sí y con una responsabilidad bien definida':
              true,
          'Módulos que dependen totalmente unos de otros': false,
          'Un solo módulo que haga todo': false,
          'Eliminar la modularidad': false,
        },
      ),
      Question(
        preguntaId: "3-7",
        titulo: "¿Qué son las pruebas unitarias?",
        opciones: {
          'Pruebas de las partes más pequeñas del código, como funciones o métodos':
              true,
          'Pruebas del sistema completo en producción': false,
          'Pruebas de la red del cliente': false,
          'Encuestas de satisfacción': false,
        },
      ),
      Question(
        preguntaId: "3-8",
        titulo: "¿Cuál es el objetivo de las pruebas de integración?",
        opciones: {
          'Verificar que los módulos funcionen correctamente en conjunto': true,
          'Revisar la ortografía del código': false,
          'Medir el tamaño del archivo final': false,
          'Probar solo una variable': false,
        },
      ),
      Question(
        preguntaId: "3-9",
        titulo: "¿Qué es un patrón de diseño?",
        opciones: {
          'Una solución reutilizable a un problema común de diseño': true,
          'Un error frecuente en el código': false,
          'Una plantilla de colores': false,
          'Un tipo de licencia': false,
        },
      ),
      Question(
        preguntaId: "3-10",
        titulo: "¿Qué es la refactorización?",
        opciones: {
          'Mejorar la estructura interna del código sin cambiar su comportamiento':
              true,
          'Agregar nuevas funcionalidades al sistema': false,
          'Borrar todo el código y empezar de nuevo': false,
          'Cambiar el lenguaje de programación': false,
        },
      ),
    ];
  }

  //confirmacion de salida
  void mostrarConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¿Deseas salir?"),
        content: const Text("Tu progreso no se guardará."),
        actions: [
          // Permanecer en el cuestionario
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
              Navigator.pop(this.context); // Sale del cuestionario
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
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
