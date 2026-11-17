import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/entities/rango.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

//Muestra el rango del jugador arriba de las tablas de Records:
//la imagen de su nivel, el nombre del rango y sus puntos totales
class TarjetaRango extends StatelessWidget {
  final RangoJugador rangoJugador;

  const TarjetaRango({super.key, required this.rangoJugador});

  //cada nivel tiene su imagen: assets/images/level_1.jpg ... level_6.jpg
  String get rutaImagen =>
      'assets/images/level_${rangoJugador.rango.nivel}.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //imagen del nivel; si falta el archivo se muestra un icono generico
        Image.asset(
          rutaImagen,
          height: 180,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const SizedBox(
            height: 180,
            child: Icon(
              Icons.emoji_events,
              size: 120,
              color: Appcolors.primario,
            ),
          ),
        ),

        //---------------------*----------------------------
        //nombre del rango, grande y en negritas
        Text(
          rangoJugador.rango.nombre,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Appcolors.seleccionado,
          ),
        ),

        //puntos totales
        Text(
          "${rangoJugador.puntos} puntos",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
