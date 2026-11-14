// Se importa con prefijo "bd" por consistencia con los demas repositorios
// y para no mezclar las clases de Drift con las entidades del dominio.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';

// Implementacion del contrato usando Drift.
class PuntajeRepositorioImpl implements PuntajeRepositorio {
  final bd.AppDatabase _baseDatos;

  PuntajeRepositorioImpl(this._baseDatos);

  @override
  Future<List<Puntajes>> obtenerPuntajes() async {
    final filas = await _baseDatos.obtenerPuntajesConLeccion();

    // Convierte cada fila del join en una entidad del dominio
    return filas
        .map(
          (fila) => Puntajes(
            puntajeId: fila.puntaje.idPuntaje,
            moduloId: fila.puntaje.idModulo,
            pasoId: fila.puntaje.idPaso,
            nombreLeccion: fila.nombreLeccion,
            puntaje: fila.puntaje.puntaje,
          ),
        )
        .toList();
  }

  @override
  Future<void> actualizarPuntaje(int moduloId, int pasoId, int puntaje) {
    return _baseDatos.actualizarPuntaje(moduloId, pasoId, puntaje);
  }

  @override
  Future<List<PuntajesExamen>> obtenerPuntajesExamen() async {
    final filas = await _baseDatos.obtenerPuntajesExamenConModulo();

    // Convierte cada fila del join en una entidad del dominio
    return filas
        .map(
          (fila) => PuntajesExamen(
            puntajeExamenId: fila.puntaje.idPuntajeExamen,
            moduloId: fila.puntaje.idModulo,
            nombreModulo: fila.nombreModulo,
            puntaje: fila.puntaje.puntaje,
          ),
        )
        .toList();
  }

  @override
  Future<int?> obtenerPuntajeExamen(int moduloId) {
    return _baseDatos.obtenerPuntajeExamen(moduloId);
  }

  @override
  Future<void> actualizarPuntajeExamen(int moduloId, int puntaje) {
    return _baseDatos.actualizarPuntajeExamen(moduloId, puntaje);
  }
}