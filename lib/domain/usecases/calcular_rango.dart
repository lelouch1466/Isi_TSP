import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';
import 'package:isi_tsp/domain/entities/rango.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';

// Regla de negocio: el rango del jugador sale de su puntaje global.
// - El puntaje global es la suma de todos los cuestionarios, todos los
//   examenes y la racha de endless (endless se guarda junto a los examenes).
// - Con esa suma se busca el rango en Rango.desdePuntaje.
// Solo usa los contratos de domain; no sabe que por dentro es Drift.
class CalcularRango {
  final PuntajeRepositorio _puntajes;

  CalcularRango(this._puntajes);

  Future<RangoJugador> call() async {
    final List<Puntajes> cuestionarios = await _puntajes.obtenerPuntajes();
    final List<PuntajesExamen> examenes = await _puntajes
        .obtenerPuntajesExamen();

    // suma de todo: cuestionarios + examenes + endless
    int total = 0;
    for (final p in cuestionarios) {
      total += p.puntaje;
    }
    for (final e in examenes) {
      total += e.puntaje;
    }

    return RangoJugador(puntos: total, rango: Rango.desdePuntaje(total));
  }
}
