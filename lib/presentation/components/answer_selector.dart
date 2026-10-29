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

  /*
  No sirvio pero lo dejo por si acaso
  late final List<MapEntry<String, bool>> opciones_aleatorias;
  
  
  //cosa que tengo que poner para que me deje usar widget para clonar la lista
  @override
  void initState() {
    super.initState();

    opciones_aleatorias = widget.lista_opciones.entries.toList()
      ..shuffle();
  }

*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var opcion in widget.lista_opciones.entries)
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
