import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/modulos.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';
import 'package:isi_tsp/presentation/components/leccion_selector.dart';
import 'package:isi_tsp/presentation/components/mode_box.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/core/text_styles.dart';
import 'package:isi_tsp/presentation/screens/examen_screen.dart';
import 'package:isi_tsp/presentation/screens/leccion_map.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';
import 'package:isi_tsp/presentation/screens/records_screen.dart';

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
          GestureDetector(
            onLongPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecordsScreen()),
              );
            },
            child: Image.asset("assets/images/wtmk.jpg"),
          ),
          Text("welcome to mario kart"),

          //---------------------*----------------------------
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
              //---------------------*----------------------------
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

          //---------------------*----------------------------
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
                onPressed: () async {
                  if (ultima_seleccion != null) {
                    //primero se pregunta a la BD si el siguiente modulo
                    //esta bloqueado (devuelve null si es el ultimo modulo)
                    final bool? siguiente_bloqueado =
                        await GetIt.instance<ModulosRepositorio>()
                            .siguienteModuloBloqueado(ultima_seleccion!);

                    //el examen solo se habilita si el siguiente modulo
                    //existe y ya esta desbloqueado
                    final bool examen_desbloqueado =
                        siguiente_bloqueado == false;

                    //despues de un await la pantalla pudo cerrarse
                    if (!context.mounted) return;

                    if ([1, 2, 3].contains(ultima_seleccion)) {
                      //si es algun modulo de leccion abrir opciones
                      showDialog(
                        context: context,
                        builder: (ctx) =>
                            confirmar_modo(context, examen_desbloqueado),
                      );
                    } else {
                      //si es el 4 abrir examen directamente
                      //(aqui no hay dialogo abierto, asi que no se hace pop)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ExamenScreen(moduloId: ultima_seleccion!),
                        ),
                      );
                    }
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

  //===============================*======================================
  //===============================*======================================
  ModeBox confirmar_modo(BuildContext context, bool examen_desbloqueado) {
    return ModeBox(
      avanzar_leccion: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            //se manda el modulo que se presiono
            builder: (context) => LeccionMap(moduloId: ultima_seleccion!),
          ),
        );
      },
      tomar_examen: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamenScreen(moduloId: ultima_seleccion!),
          ),
        );
      },
      examen_desbloqueado: examen_desbloqueado,
    );
  }

  //===============================*======================================
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
