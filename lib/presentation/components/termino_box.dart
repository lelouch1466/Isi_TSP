import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

//Dialogo que muestra un termino del glosario en grande
class TerminoBox extends StatelessWidget {
  final String termino;
  final String descripcion;

  const TerminoBox({
    super.key,
    required this.termino,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //el termino, grande y en negritas
      title: Text(
        termino,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Appcolors.seleccionado,
        ),
      ),

      //la descripcion; con scroll por si es muy larga
      content: SingleChildScrollView(
        child: Text(
          descripcion,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),

      //boton abajo y centrado
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); //cierra el TerminoBox
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.primario,
            foregroundColor: Colors.white,
          ),
          child: const Text("Cerrar"),
        ),
      ],
    );
  }
}
