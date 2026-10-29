import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class LeccionSelector extends StatefulWidget {
  final bool seleccionado;
  final Function() cambio_seleccion;

  const LeccionSelector({
    super.key,
    required this.seleccionado,
    required this.cambio_seleccion,
  });

  @override
  State<LeccionSelector> createState() => _LeccionSelectorState();
}

//boton de seleccion
class _LeccionSelectorState extends State<LeccionSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            //que se cambie de color al ser seleccionado
            onTap: () {
              widget.cambio_seleccion();
            },
            //tolo lo que tenga de ver con visualizacion
            child: Container(
              decoration: BoxDecoration(
                color: widget.seleccionado
                    ? Appcolors.seleccionado
                    : Appcolors.primario,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [Text("data", style: TextStyles.bodyText)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
