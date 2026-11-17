import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

//Dibuja las lineas del camino entre los circulos del mapa.
//Se dibuja DETRAS de los circulos, por eso cada linea va de centro a centro
//y los circulos tapan las puntas.
//- linea azul oscura: el paso al que llega ya esta disponible
//- linea gris: el paso al que llega sigue bloqueado
class CaminoPasos extends CustomPainter {
  //centro de cada circulo, en el mismo orden que los pasos
  final List<Offset> centros;

  //disponible[i] = true si el paso i esta desbloqueado
  final List<bool> disponible;

  CaminoPasos({required this.centros, required this.disponible});

  //grosor de las lineas del camino
  static const double grosorLinea = 14;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < centros.length - 1; i++) {
      final Paint pincel = Paint()
        ..color = disponible[i + 1]
            ? Appcolors.seleccionado
            : Appcolors.bloqueado
        ..strokeWidth = grosorLinea
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(centros[i], centros[i + 1], pincel);
    }
  }

  //solo se vuelve a dibujar si cambiaron los pasos o el tamano de la pantalla
  @override
  bool shouldRepaint(CaminoPasos anterior) {
    return !listEquals(anterior.centros, centros) ||
        !listEquals(anterior.disponible, disponible);
  }
}
