import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/components/leccion_selector.dart';

class HomeIsi extends StatefulWidget {
  const HomeIsi({super.key});

  @override
  State<HomeIsi> createState() => _HomeIsiState();
}

class _HomeIsiState extends State<HomeIsi> {
  int? ultima_seleccion;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: insertarBoton(2),
        ),        Padding(
          padding: const EdgeInsets.all(8.0),
          child: insertarBoton(3),
        ),        Padding(
          padding: const EdgeInsets.all(8.0),
          child: insertarBoton(4),
        ),

        Spacer(),

        Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("boton sumamente importante :v"),
            ),
          ),
        ),
      ],
    );
  }

  LeccionSelector insertarBoton(int num_leccion) {
    return LeccionSelector(
        //unacondicion que le manda verdadero o falso
        seleccionado: ultima_seleccion == num_leccion,
        //la funcion que cambia el estado
        cambio_seleccion: () {
          setState(() {
            ultima_seleccion = num_leccion;
          });
        },
      );
  }
}
