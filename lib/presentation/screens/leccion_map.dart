import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

class LeccionMap extends StatefulWidget {
  const LeccionMap({super.key});

  @override
  State<LeccionMap> createState() => _LeccionMapState();
}

class _LeccionMapState extends State<LeccionMap> {
  Map<int, bool> mapa_desbloqueado = {
    0: true,
    1: true,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraApp.barrita("Mapa"),
      //Primero los parametros
      body: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //aqui los circulos y lineas
          children: [
            for (int var1 = 0; var1 < mapa_desbloqueado.length; var1++) ...[
              GestureDetector(
                //que hace el boton
                onTap: () {
                  setState(() {
                    if (mapa_desbloqueado[var1] == true) {
                      mapa_desbloqueado[var1] = false;
                    } else {
                      mapa_desbloqueado[var1] = true;

                    }
                  });
                },

                //cosas visuales del boton
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: mapa_desbloqueado[var1] == true
                      ? Colors.blue
                      : Appcolors.opcionseleccion,
                  child: Text("${var1 + 1}"),
                ),
              ),

              if (var1 < mapa_desbloqueado.length - 1)
                Center(
                  child: Container(
                    width: 60,
                    height: 3,
                    color: mapa_desbloqueado[var1] == true
                        ? Colors.blue
                        : Appcolors.opcionseleccion,
                  ),
                ),
            ],

            /*
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: Text("1"),
            ),
            
            Center(
              child: Container(
                width: 60,
                height: 3,
                color: Colors.grey,
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
