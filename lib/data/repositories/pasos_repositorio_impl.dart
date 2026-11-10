import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/pasos.dart';
import 'package:isi_tsp/domain/repositories/pasos_repositorio.dart';

// Implementacion del contrato usando Drift.
class PasosRepositorioImpl implements PasosRepositorio {
  final bd.AppDatabase _baseDatos;

  PasosRepositorioImpl(this._baseDatos);

  @override
  Future<List<Pasos>> obtenerPasosPorModulo(int moduloId) async {
    final List<bd.PasoData> filas = await _baseDatos.obtenerPasosPorModulo(
      moduloId,
    );
    return _aEntidades(filas);
  }

  @override
  Stream<List<Pasos>> observarPasosPorModulo(int moduloId) {
    //cada vez que Drift emite filas nuevas, se convierten a entidades
    return _baseDatos.observarPasosPorModulo(moduloId).map(_aEntidades);
  }

  @override
  Future<void> desbloquearPaso(int pasoId) {
    return _baseDatos.desbloquearPaso(pasoId);
  }

  // Convierte las filas de Drift (PasoData) en entidades del dominio (Pasos)
  List<Pasos> _aEntidades(List<bd.PasoData> filas) {
    return filas
        .map(
          (fila) => Pasos(
            pasoId: fila.idPaso,
            moduloId: fila.idModulo,
            numero: fila.numero,
            nombreLeccion: fila.nombreLeccion,
            bloqueado: fila.bloqueado,
            tipoContenido: fila.tipoContenido,
          ),
        )
        .toList();
  }
}
