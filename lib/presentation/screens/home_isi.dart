import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/modulos.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';
import 'package:isi_tsp/presentation/components/leccion_selector.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';
import 'package:isi_tsp/presentation/screens/leccion_map.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';

class HomeIsi extends StatefulWidget {
  const HomeIsi({super.key});

  @override
  State<HomeIsi> createState() => _HomeIsiState();
}

class _HomeIsiState extends State<HomeIsi> {
  int? ultima_seleccion;

  //se crea una sola vez, pero emite una lista nueva cada vez que
  //cambian los modulos en la BD (por ejemplo al desbloquear uno)
  late final Stream<List<Modulos>> modulos_bd;

  @override
  void initState() {
    super.initState();
    //se pide el repositorio de la bd
    modulos_bd = GetIt.instance<ModulosRepositorio>().observarModulos();

    /*
    //solo para revisar: imprime en la consola la primera lista que llega
    modulos_bd.first
        .then((lista) {
          debugPrint('Modulos encontrados: ${lista.length}');
          for (final m in lista) {
            debugPrint(m.toString());
          }
        })
        .catchError((Object error) {
          debugPrint('Error al consultar modulos: $error');
        });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/wtmk.jpg"),
          Text("welcome to mario kart"),

          //botones de los modulos leidos de la base de datos
          //StreamBuilder se redibuja solo cada vez que el Stream emite
          StreamBuilder<List<Modulos>>(
            stream: modulos_bd,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error al cargar módulos: ${snapshot.error}");
              }
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  for (final modulo in snapshot.data!)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: insertarBoton(
                        modulo.moduloId,
                        modulo.nombre,
                        modulo.bloqueado,
                      ),
                    ),
                ],
              );
            },
          ),

          Spacer(),

          //boton de siguiente
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                //estilo del boton
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(93, 58, 35, 208),
                  ),
                ),
                //funcion y texto
                onPressed: () {
                  if (ultima_seleccion != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //se manda el modulo que se presiono
                        builder: (context) =>
                            LeccionMap(moduloId: ultima_seleccion!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("selecciona una opcion"),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.symmetric(vertical: 70),
                      ),
                    );
                  }
                },
                child: Text(
                  "boton sumamente importante :v",
                  style: TextStyles.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LeccionSelector insertarBoton(
    int num_leccion,
    String nombre,
    bool estado_bloqueo,
  ) {
    return LeccionSelector(
      //unacondicion que le manda verdadero o falso
      seleccionado: ultima_seleccion == num_leccion,
      //la funcion que cambia el estado
      cambio_seleccion: () {
        setState(() {
          ultima_seleccion = num_leccion;
        });
      },
      //nombre del boton
      nombre_boton: nombre,
      //si esta o no blouqeado
      bloqueado: estado_bloqueo,
    );
  }
}
