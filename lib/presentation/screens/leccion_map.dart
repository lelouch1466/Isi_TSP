import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/pasos.dart';
import 'package:isi_tsp/domain/repositories/pasos_repositorio.dart';
import 'package:isi_tsp/domain/usecases/desbloquear_siguiente.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/components/mapa/camino_pasos.dart';
import 'package:isi_tsp/presentation/components/mapa/circulo_paso.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';
import 'package:isi_tsp/presentation/screens/teoria_screen.dart';

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
      //StreamBuilder se redibuja solo cada vez que el Stream emite
      body: StreamBuilder<List<Pasos>>(
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

          //LayoutBuilder da el ancho real de la pantalla para acomodar
          //el zigzag igual en cualquier telefono
          return LayoutBuilder(
            builder: (context, limites) =>
                mapaZigzag(context, lista_pasos, limites.maxWidth),
          );
        },
      ),
    );
  }

  //===============================*======================================
  //circulos en zigzag (izquierda, derecha, izquierda...) unidos por el camino
  Widget mapaZigzag(BuildContext context, List<Pasos> pasos, double ancho) {
    //el circulo mide el 14% del ancho, pero nunca menos de 42 ni mas de 62
    final double radio = (ancho * 0.14).clamp(42.0, 62.0);
    final double tamanoCirculo = CirculoPaso.tamanoTotal(radio);

    //distancia vertical entre un circulo y el siguiente
    final double separacion = radio * 2.2;
    final double margenArriba = tamanoCirculo / 2 + 24;

    //centro de cada circulo: los pares a la izquierda (28% del ancho)
    //y los impares a la derecha (72% del ancho)
    final List<Offset> centros = [
      for (int i = 0; i < pasos.length; i++)
        Offset(
          i.isEven ? ancho * 0.28 : ancho * 0.72,
          margenArriba + i * separacion,
        ),
    ];
    final double altoTotal = centros.last.dy + tamanoCirculo / 2 + 24;

    //el siguiente por hacer es el ultimo paso desbloqueado
    final int indiceSiguiente = pasos.lastIndexWhere((p) => p.disponible);

    //---------------------*----------------------------
    //si no cabe a lo alto, la pantalla se desliza hacia abajo
    return SingleChildScrollView(
      child: SizedBox(
        width: ancho,
        height: altoTotal,
        child: Stack(
          children: [
            //primero el camino, para que quede detras de los circulos
            Positioned.fill(
              child: CustomPaint(
                painter: CaminoPasos(
                  centros: centros,
                  disponible: [for (final p in pasos) p.disponible],
                ),
              ),
            ),

            //despues los circulos, cada uno centrado en su punto
            for (int i = 0; i < pasos.length; i++)
              Positioned(
                left: centros[i].dx - tamanoCirculo / 2,
                top: centros[i].dy - tamanoCirculo / 2,
                child: CirculoPaso(
                  paso: pasos[i],
                  radio: radio,
                  esSiguiente: i == indiceSiguiente,
                  alTocar: () => abrirPaso(context, pasos[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  //===============================*======================================
  //que hace el boton de cada paso (misma logica de antes)
  void abrirPaso(BuildContext context, Pasos paso) {
    //si esta bloqueado solo manda mensaje de que esta bloqueado
    if (!paso.disponible) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Paso bloqueado: "
            "${paso.nombreLeccion} "
            "(${paso.tipoContenido})",
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (paso.esCuestionario) {
      //si es cuestionario abre el cuestionario
      Navigator.push(
        context,
        MaterialPageRoute(
          //se manda el modulo y el paso de las preguntas que debe cargar
          builder: (context) => QuestionScreen(
            moduloId: widget.moduloId,
            pasoId: paso.pasoId,
            desbloquear_siguiente: () {
              GetIt.instance<DesbloquearSiguiente>()(paso);
            },
          ),
        ),
      );
    } else if (paso.esTeoria) {
      //si es teoria, abre teoria
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeoriaScreen(
            desbloquear_siguiente: () {
              GetIt.instance<DesbloquearSiguiente>()(paso);
            },
            modulo_id: widget.moduloId,
            paso_id: paso.pasoId,
          ),
        ),
      );
    }
  }
}
