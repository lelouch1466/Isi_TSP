import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:isi_tsp/data/musica/musica_constantes.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';
import 'package:just_audio/just_audio.dart';

// Implementacion del contrato usando just_audio.
// Hay un solo reproductor para toda la app (se registra como singleton),
// asi la musica no se corta ni se duplica al cambiar de pantalla.
class ServicioMusicaImpl implements ServicioMusica {
  final AudioPlayer _reproductor = AudioPlayer();

  // avisa a todos los botones de sonido cuando cambia el silencio.
  // "broadcast" = lo pueden escuchar varias pantallas al mismo tiempo
  final StreamController<bool> _silencioController =
      StreamController<bool>.broadcast();

  // la app siempre arranca con sonido (el silencio no se guarda)
  bool _silenciado = false;

  @override
  Future<void> iniciar() async {
    try {
      await _reproductor.setAsset(rutaMusicaFondo);

      // LoopMode.one repite la misma cancion sin pausa entre vueltas
      await _reproductor.setLoopMode(LoopMode.one);
      await _reproductor.setVolume(volumenMusica);

      // por si el usuario silencio mientras la cancion cargaba
      if (!_silenciado) _reproducir();
    } catch (error) {
      // si falta el archivo o falla el audio, la app sigue sin musica
      debugPrint('Error al iniciar la musica: $error');
    }
  }

  @override
  Future<void> alternarSilencio() async {
    _silenciado = !_silenciado;
    _silencioController.add(_silenciado);

    // silenciar = pausar: no gasta bateria y al volver sigue donde iba
    if (_silenciado) {
      await _pausar();
    } else {
      _reproducir();
    }
  }

  @override
  bool get estaSilenciado => _silenciado;

  @override
  Stream<bool> observarSilenciado() => _silencioController.stream;

  @override
  Future<void> pausarPorSegundoPlano() async {
    await _pausar();
  }

  @override
  Future<void> reanudarDesdeSegundoPlano() async {
    // si el usuario la silencio, al volver se queda en silencio
    if (!_silenciado) _reproducir();
  }

  @override
  Future<void> liberar() async {
    try {
      await _silencioController.close();
      await _reproductor.dispose();
    } catch (error) {
      debugPrint('Error al liberar la musica: $error');
    }
  }

  // play() de just_audio no termina hasta que la musica se pausa,
  // por eso NO se espera con await; los errores se atrapan aparte
  void _reproducir() {
    _reproductor.play().catchError((Object error) {
      debugPrint('Error al reproducir la musica: $error');
    });
  }

  Future<void> _pausar() async {
    try {
      await _reproductor.pause();
    } catch (error) {
      debugPrint('Error al pausar la musica: $error');
    }
  }
}
