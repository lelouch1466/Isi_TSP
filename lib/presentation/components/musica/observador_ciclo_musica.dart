import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';

//envuelve toda la app y pausa la musica cuando se minimiza,
//y la reanuda cuando se vuelve a abrir.
//no dibuja nada propio: solo muestra a "child" tal cual
class ObservadorCicloMusica extends StatefulWidget {
  final Widget child;

  const ObservadorCicloMusica({super.key, required this.child});

  @override
  State<ObservadorCicloMusica> createState() => _ObservadorCicloMusicaState();
}

class _ObservadorCicloMusicaState extends State<ObservadorCicloMusica> {
  late final ServicioMusica musica;
  late final AppLifecycleListener escuchaCiclo;

  @override
  void initState() {
    super.initState();
    //se pide el servicio de musica (el mismo para toda la app)
    musica = GetIt.instance<ServicioMusica>();

    //onHide: la app se minimizo o se bloqueo el telefono
    //onShow: la app se volvio a ver en pantalla
    escuchaCiclo = AppLifecycleListener(
      onHide: () {
        musica.pausarPorSegundoPlano();
      },
      onShow: () {
        musica.reanudarDesdeSegundoPlano();
      },
    );
  }

  @override
  void dispose() {
    //se deja de escuchar al cerrar
    escuchaCiclo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
