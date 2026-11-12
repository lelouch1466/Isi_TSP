import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class ModeBox extends StatefulWidget {
  final Function() avanzar_leccion;
  final Function() tomar_examen;
  final bool examen_desbloqueado;

  const ModeBox({
    super.key,
    required this.avanzar_leccion,
    required this.tomar_examen,
    required this.examen_desbloqueado,
  });

  @override
  State<ModeBox> createState() => _ModeBoxState();
}

class _ModeBoxState extends State<ModeBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Appcolors.barraap,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          Text("Elige la modalidad", style: TextStyles.seleccionmodo),
          SizedBox(height: 30),
          //---------------------*----------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //boton de leccion
              TextButton(
                onPressed: widget.avanzar_leccion,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.menu_book, size: 30), Text("Lección")],
                ),
              ),

              SizedBox(width: 20),

              //boton de examen
              TextButton(
                onPressed: widget.examen_desbloqueado
                    ? widget.tomar_examen
                    : null,
                style: TextButton.styleFrom(
                  backgroundColor: widget.examen_desbloqueado
                      ? null
                      : Colors.grey,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.quiz, size: 30), Text("Tomar examen")],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
