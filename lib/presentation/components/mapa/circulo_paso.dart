import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/entities/pasos.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

//Circulo de un paso en el mapa de lecciones.
//- disponible: azul con su numero
//- bloqueado: gris con candado
//- el siguiente por hacer lleva un anillo azul claro alrededor
class CirculoPaso extends StatelessWidget {
  final Pasos paso;
  final double radio;
  final bool esSiguiente;
  final Function() alTocar;

  const CirculoPaso({
    super.key,
    required this.paso,
    required this.radio,
    required this.esSiguiente,
    required this.alTocar,
  });

  //grosor del anillo y espacio entre el anillo y el circulo
  static const double grosorAnillo = 6;
  static const double espacioAnillo = 5;

  //medida total del widget (circulo + anillo), para acomodarlo en el mapa
  static double tamanoTotal(double radio) =>
      radio * 2 + (grosorAnillo + espacioAnillo) * 2;

  @override
  Widget build(BuildContext context) {
    final double tamano = tamanoTotal(radio);

    return GestureDetector(
      onTap: alTocar,
      child: Container(
        width: tamano,
        height: tamano,
        padding: const EdgeInsets.all(espacioAnillo),
        //el anillo solo se dibuja en el siguiente paso por hacer
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: esSiguiente ? Appcolors.barraap : Colors.transparent,
            width: grosorAnillo,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: paso.disponible ? Appcolors.primario : Appcolors.bloqueado,
          ),
          padding: EdgeInsets.all(radio * 0.18),
          //scaleDown: si el texto no cabe se encoge, nunca se sale del circulo
          child: FittedBox(fit: BoxFit.scaleDown, child: contenido()),
        ),
      ),
    );
  }

  //===============================*======================================
  //lo que va dentro del circulo, todo centrado
  Widget contenido() {
    const Color blanco = Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //numero del paso, o candado si esta bloqueado
        paso.disponible
            ? Text(
                "${paso.numero}",
                style: const TextStyle(
                  color: blanco,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Icon(Icons.lock, color: blanco, size: 26),

        //---------------------*----------------------------
        //tipo de paso
        Text(
          paso.esTeoria ? "Teoría" : "Cuestionario",
          textAlign: TextAlign.center,
          style: const TextStyle(color: blanco, fontSize: 14),
        ),

        //los cuestionarios tambien muestran su codigo (ej. Mdl1P2C)
        if (paso.esCuestionario)
          Text(
            paso.nombreLeccion,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
      ],
    );
  }
}
