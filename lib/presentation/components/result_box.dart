import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';
import 'package:isi_tsp/presentation/screens/home_isi.dart';

class ResultBox extends StatelessWidget {
  final int puntaje_final;
  final int total_preguntas;
  final VoidCallback reinicio;
  //false = no se muestra el boton de regresar al mapa (por ejemplo en el examen)
  final bool mostrar_regresar;

  const ResultBox({
    super.key,
    required this.puntaje_final,
    required this.total_preguntas,
    required this.reinicio,
    this.mostrar_regresar = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
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
              //-------------------------------------------------
              //boton reinicio
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
              //boton regresar a leccion (solo si se pidio mostrarlo)
              if (mostrar_regresar) ...[
              SizedBox(height: 20),
              // Botón de salir
              TextButton.icon(
                onPressed: () {
                  //1er pop cierra el ResultBox (el dialogo es otra ruta)
                  //2do pop cierra QuestionScreen y regresa al mapa
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                },

                icon: Icon(
                  calificar_puntaje() ? Icons.check : Icons.keyboard_return,
                ),
                label: Text(
                  calificar_puntaje() ? "Aceptar" : "Regresar al Mapa",
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 231, 232, 235),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              ],

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
      ),
    );
  }

  bool calificar_puntaje() {
    return (puntaje_final * 100 / total_preguntas) >= 80;
  }
}
