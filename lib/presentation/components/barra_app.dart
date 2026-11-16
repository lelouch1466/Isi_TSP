import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/components/musica/boton_sonido.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

class BarraApp {
  //acciones: widgets extra a la derecha (por ejemplo el puntaje).
  //el boton de sonido siempre va al final, en todas las pantallas
  static AppBar barrita(String titulo, {List<Widget> acciones = const []}) {
    return AppBar(
      backgroundColor: Appcolors.barraap,
      title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [...acciones, const BotonSonido()],
    );
  }
}
