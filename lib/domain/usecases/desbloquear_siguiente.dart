import 'package:isi_tsp/domain/entities/modulos.dart';
import 'package:isi_tsp/domain/entities/pasos.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';
import 'package:isi_tsp/domain/repositories/pasos_repositorio.dart';

// Regla de negocio: al terminar un paso se desbloquea lo que sigue.
// - Si hay otro paso despues en el mismo modulo, se desbloquea ese paso.
// - Si era el ultimo paso del modulo, se desbloquea el siguiente modulo
//   y su primer paso.
// Solo usa los contratos de domain; no sabe que por dentro es Drift.
class DesbloquearSiguiente {
  final PasosRepositorio _pasos;
  final ModulosRepositorio _modulos;

  DesbloquearSiguiente(this._pasos, this._modulos);

  Future<void> call(Pasos pasoTerminado) async {
    // pasos del mismo modulo, ordenados por numero
    final List<Pasos> pasosDelModulo = await _pasos.obtenerPasosPorModulo(
      pasoTerminado.moduloId,
    );

    // 1) siguiente paso dentro del mismo modulo
    for (final paso in pasosDelModulo) {
      if (paso.numero > pasoTerminado.numero) {
        await _pasos.desbloquearPaso(paso.pasoId);
        return;
      }
    }

    // 2) era el ultimo paso: siguiente modulo (ordenados por id)
    final List<Modulos> listaModulos = await _modulos.obtenerModulos();
    final int posicion = listaModulos.indexWhere(
      (m) => m.moduloId == pasoTerminado.moduloId,
    );
    if (posicion == -1 || posicion == listaModulos.length - 1) {
      return; //no hay siguiente modulo
    }

    final Modulos siguienteModulo = listaModulos[posicion + 1];
    await _modulos.desbloquearModulo(siguienteModulo.moduloId);

    // tambien su primer paso, por si estuviera bloqueado
    final List<Pasos> pasosSiguiente = await _pasos.obtenerPasosPorModulo(
      siguienteModulo.moduloId,
    );
    if (pasosSiguiente.isNotEmpty) {
      await _pasos.desbloquearPaso(pasosSiguiente.first.pasoId);
    }
  }
}