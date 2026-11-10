import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/pasos.dart';
import 'package:isi_tsp/domain/repositories/pasos_repositorio.dart';
import 'package:isi_tsp/domain/usecases/desbloquear_siguiente.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';

class LeccionMap extends StatefulWidget {
  //id del modulo que se presiono en HomeIsi
  final int moduloId;

  const LeccionMap({super.key, required this.moduloId});

  @override
  State<LeccionMap> createState() => _LeccionMapState();
}

class _LeccionMapState extends State<LeccionMap> {
  //se crea una sola vez, pero emite una lista nueva cada vez que
  //cambian los pasos en la BD (por ejemplo al desbloquear uno)
  late final Stream<List<Pasos>> pasos_bd;

  @override
  void initState() {
    super.initState();
    //se pide el repositorio de la bd con el modulo que mando HomeIsi
    pasos_bd = GetIt.instance<PasosRepositorio>().observarPasosPorModulo(
      widget.moduloId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraApp.barrita("Mapa"),
      //Primero los parametros
      body: SizedBox(
        height: 120,
        //StreamBuilder se redibuja solo cada vez que el Stream emite
        child: StreamBuilder<List<Pasos>>(
          stream: pasos_bd,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error al cargar pasos: ${snapshot.error}"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<Pasos> lista_pasos = snapshot.data!;

            if (lista_pasos.isEmpty) {
              return const Center(child: Text("Este modulo no tiene pasos"));
            }

            return ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //aqui los circulos y lineas
              children: [
                for (int var1 = 0; var1 < lista_pasos.length; var1++) ...[
                  GestureDetector(
                    //que hace el boton
                    onTap: () {
                      //si esta bloqueado no manda mensaje de que esta bloqueado
                      if (!lista_pasos[var1].disponible) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Paso bloqueado: "
                              "${lista_pasos[var1].nombreLeccion} "
                              "(${lista_pasos[var1].tipoContenido})",
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (lista_pasos[var1].esCuestionario) {
                        //si es cuestionario abre el cuestionario
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //se manda el modulo y el paso de las prreguntas que debe cargar
                            builder: (context) => QuestionScreen(
                              moduloId: widget.moduloId,
                              pasoId: lista_pasos[var1].pasoId,
                              desbloquear_siguiente: () {
                                GetIt.instance<DesbloquearSiguiente>()(
                                  lista_pasos[var1],
                                );
                              },
                            ),
                          ),
                        );
                      } else if (lista_pasos[var1].esTeoria) {
                        //si es teoria, abre teoria
                        //al terminarla se desbloquea lo que sigue; el mapa
                        //se actualiza solo porque escucha la BD con watch()
                        GetIt.instance<DesbloquearSiguiente>()(
                          lista_pasos[var1],
                        );
                      }
                    },

                    //cosas visuales del boton
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: lista_pasos[var1].disponible
                          ? Colors.blue
                          : Appcolors.opcionseleccion,
                      child: Text("${lista_pasos[var1].numero}"),
                    ),
                  ),

                  if (var1 < lista_pasos.length - 1)
                    Center(
                      child: Container(
                        width: 60,
                        height: 3,
                        color: lista_pasos[var1 + 1].disponible
                            ? Colors.blue
                            : Appcolors.opcionseleccion,
                      ),
                    ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
