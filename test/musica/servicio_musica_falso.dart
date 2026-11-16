import 'dart:async';

import 'package:isi_tsp/domain/musica/servicio_musica.dart';

// Servicio de musica falso para las pruebas.
// No reproduce nada (no usa just_audio); solo cuenta cuantas veces se
// llamo cada metodo para revisarlo en las pruebas.
class ServicioMusicaFalso implements ServicioMusica {
  final StreamController<bool> _silencioController =
      StreamController<bool>.broadcast();

  bool _silenciado = false;

  int vecesIniciar = 0;
  int vecesAlternar = 0;
  int vecesPausar = 0;
  int vecesReanudar = 0;
  int vecesLiberar = 0;

  @override
  Future<void> iniciar() async {
    vecesIniciar++;
  }

  @override
  Future<void> alternarSilencio() async {
    vecesAlternar++;
    _silenciado = !_silenciado;
    _silencioController.add(_silenciado);
  }

  @override
  bool get estaSilenciado => _silenciado;

  @override
  Stream<bool> observarSilenciado() => _silencioController.stream;

  @override
  Future<void> pausarPorSegundoPlano() async {
    vecesPausar++;
  }

  @override
  Future<void> reanudarDesdeSegundoPlano() async {
    vecesReanudar++;
  }

  @override
  Future<void> liberar() async {
    vecesLiberar++;
    await _silencioController.close();
  }
}
