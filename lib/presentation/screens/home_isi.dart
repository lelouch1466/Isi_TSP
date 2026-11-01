import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/components/leccion_selector.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';

class HomeIsi extends StatefulWidget {
  const HomeIsi({super.key});

  @override
  State<HomeIsi> createState() => _HomeIsiState();
}

class _HomeIsiState extends State<HomeIsi> {
  int? ultima_seleccion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/wtmk.jpg"),
          Text("welcome to mario kart"),
          /*
          for(int var1=1; var1<4;var1++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: insertarBoton(var1),
            ),
      */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: insertarBoton(1, "modulo 1"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: insertarBoton(2, "modulo 2"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: insertarBoton(3, "modulo 3"),
          ),
      
          Spacer(),
      
          //boton de siguiente
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                //estilo del boton
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(93, 58, 35, 208),
                  ),
                ),
                //funcion y texto
                onPressed: () {
                  if (ultima_seleccion != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionScreen()),
                    );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        content: Text("selecciona una opcion"),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.symmetric(vertical: 70),
                        ),
                    );
                  }
                },
                child: Text(
                  "boton sumamente importante :v",
                  style: TextStyles.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LeccionSelector insertarBoton(int num_leccion, String nombre) {
    return LeccionSelector(
      //unacondicion que le manda verdadero o falso
      seleccionado: ultima_seleccion == num_leccion,
      //la funcion que cambia el estado
      cambio_seleccion: () {
        setState(() {
          ultima_seleccion = num_leccion;
        });
      },
      nombre_boton: nombre,
    );
  }
}
