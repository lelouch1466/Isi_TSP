import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';
import 'package:isi_tsp/presentation/screens/home_isi.dart';

class ResultBox extends StatelessWidget {
  final int puntaje_final;
  final int total_preguntas;
  final VoidCallback reinicio;

  const ResultBox({
    super.key,
    required this.puntaje_final,
    required this.total_preguntas,
    required this.reinicio,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //visuales de caja
      backgroundColor: Appcolors.secundario,

      //cosas dentro de la caja
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //---------------------*----------------------------
            Text("Puntaje", style: TextStyles.bold),
            const SizedBox(height: 20),
            //---------------------*----------------------------
            CircleAvatar(
              radius: 60,
              //si el puntaje es menor al 80% no pasa, verde = paso /  rojo=fracaso
              backgroundColor: (puntaje_final * 100 / total_preguntas) >= 80
                  ? Colors.green
                  : Colors.red,
              child: Text(
                "$puntaje_final/$total_preguntas",
                style: TextStyles.boldresultado,
              ),
            ),
            //---------------------*----------------------------
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: SizedBox(
                width: double.maxFinite,
                //la misma condicional de 80%
                child: Text(
                  (puntaje_final * 100 / total_preguntas) >= 80
                      ? "Si se hizo :)"
                      : "chale compa, estas pal perro :v",
                  style: TextStyles.bodyText,
                ),
              ),
            ),
            //---------------------*----------------------------
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: reinicio,
              backgroundColor: const Color.fromARGB(255, 231, 232, 235),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Icon(Icons.restart_alt),
            ),

            //---------------------*----------------------------
            const SizedBox(height: 30),

            // Botón de salir
            TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeIsi()),
                  (Route<dynamic> route) => false,
                );
              },

              icon: const Icon(Icons.exit_to_app),
              label: const Text("Salir"),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 231, 232, 235),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
