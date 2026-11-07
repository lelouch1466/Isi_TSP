import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class AnswerSelector extends StatefulWidget {
  final Map<String, bool> lista_opciones;
  final Function(bool) tomar_opcion;

  //final bool seleccionado;
  //final Function(bool) cambio_seleccion;

  const AnswerSelector({
    super.key,
    required this.lista_opciones,
    required this.tomar_opcion,

    //required this.seleccionado,
    //required this.cambio_seleccion,
  });

  @override
  State<AnswerSelector> createState() => _AnswerSelectorState();
}

class _AnswerSelectorState extends State<AnswerSelector> {
  String? opcion_seleccionada;
  late List<MapEntry<String, bool>> opciones_aleatorias;

  @override
  void initState() {
    super.initState();
    opciones_aleatorias = widget.lista_opciones.entries.toList()..shuffle();
  }

  @override
  void didUpdateWidget(covariant AnswerSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    //si cambio la pregunta (otro mapa de opciones), se vuelve a mezclar
    if (widget.lista_opciones != oldWidget.lista_opciones) {
      opcion_seleccionada = null;
      opciones_aleatorias = widget.lista_opciones.entries.toList()..shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var opcion in opciones_aleatorias)
          GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(
                  opcion.key,
                  style: TextStyles.opcionPregunta,
                  textAlign: TextAlign.center,
                ),
                tileColor: Appcolors.opciones,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                selected: opcion_seleccionada == opcion.key,
                selectedTileColor: Appcolors.opcionseleccion,
                onTap: () {
                  setState(() {
                    opcion_seleccionada = opcion.key;
                  });
                  widget.tomar_opcion(opcion.value);
                },
              ),
            ),
          ),
      ],
    );
  }
}
