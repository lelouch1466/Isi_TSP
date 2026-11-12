import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/repositories/teoria_repositorio.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';

class TeoriaScreen extends StatefulWidget {
  final Function() desbloquear_siguiente;
  final int modulo_id;
  final int paso_id;

  const TeoriaScreen({
    super.key,
    required this.desbloquear_siguiente,
    required this.modulo_id,
    required this.paso_id,
  });

  @override
  State<TeoriaScreen> createState() => _TeoriaScreenState();
}

class _TeoriaScreenState extends State<TeoriaScreen> {
  final PageController controlador = PageController();

  int pagina_actual = 0;

  //textos de cada pagina; se llenan una sola vez al entrar
  List<String> teorias = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarTeorias();
  }

  //pide los textos del modulo y paso que se recibieron
  Future<void> cargarTeorias() async {
    final List<String> textos = await GetIt.instance<TeoriaRepositorio>()
        .obtenerTextosPorModuloYPaso(widget.modulo_id, widget.paso_id);

    //si el usuario salio antes de que terminara la consulta, no se actualiza
    if (!mounted) return;

    setState(() {
      teorias = textos;
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //mientras se consulta la BD se muestra el indicador de carga
    if (cargando) {
      return Scaffold(
        appBar: BarraApp.barrita("Teoría"),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: BarraApp.barrita("Teoría"),
      body: Column(
        children: [
          Expanded(
            //la pagina
            child: PageView.builder(
              controller: controlador,
              itemCount: teorias.length + 1,
              onPageChanged: (index) {
                setState(() {
                  pagina_actual = index;
                });
              },
              itemBuilder: (context, index) {
                // si es la ultima poner el boton de completado
                if (index == teorias.length) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            widget.desbloquear_siguiente();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(25),
                          ),
                          child: const Icon(Icons.check, size: 50),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "¡Has terminado la teoría!",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                //una pagina normal
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        teorias[index],
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Indicadores de página
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              teorias.length + 1,
              (index) => Container(
                margin: const EdgeInsets.all(5),
                width: pagina_actual == index ? 15 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: pagina_actual == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
