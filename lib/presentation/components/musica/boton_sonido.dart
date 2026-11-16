import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';

//boton de la barra de app para prender/apagar la musica de fondo
class BotonSonido extends StatefulWidget {
  const BotonSonido({super.key});

  @override
  State<BotonSonido> createState() => _BotonSonidoState();
}

class _BotonSonidoState extends State<BotonSonido> {
  late final ServicioMusica musica;

  @override
  void initState() {
    super.initState();
    //se pide el servicio de musica (el mismo para toda la app)
    musica = GetIt.instance<ServicioMusica>();
  }

  @override
  Widget build(BuildContext context) {
    //el icono se redibuja cada vez que cambia el silencio,
    //asi se ve igual en todas las pantallas
    return StreamBuilder<bool>(
      stream: musica.observarSilenciado(),
      initialData: musica.estaSilenciado,
      builder: (context, snapshot) {
        final bool silenciado = snapshot.data ?? false;

        //---------------------*----------------------------
        return IconButton(
          onPressed: () {
            musica.alternarSilencio();
          },
          tooltip: silenciado ? "Activar sonido" : "Silenciar",
          icon: Icon(silenciado ? Icons.volume_off : Icons.volume_up),
        );
      },
    );
  }
}
