// Se importa con prefijo "bd" porque Drift tambien genera una clase "Preguntas"
// (la tabla). Asi "Preguntas" sin prefijo es la entidad y "bd.Preguntas" la tabla.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/preguntas.dart';
import 'package:isi_tsp/domain/repositories/pregunta_repositorio.dart';

// Implementacion del contrato usando Drift.
class PreguntaRepositorioImpl implements PreguntaRepositorio {
  final bd.AppDatabase _baseDatos;

  PreguntaRepositorioImpl(this._baseDatos);

  @override
  Future<List<Preguntas>> obtenerPreguntasPorModuloYPaso(
    int moduloId,
    int pasoId,
  ) async {
    final List<bd.PreguntaData> filas = await _baseDatos
        .obtenerPreguntasPorModuloYPaso(moduloId, pasoId);
    return _aEntidades(filas);
  }

  @override
  Future<List<Preguntas>> obtenerPreguntasPorModulo(int moduloId) async {
    final List<bd.PreguntaData> filas = await _baseDatos
        .obtenerPreguntasPorModulo(moduloId);
    return _aEntidades(filas);
  }

  // Convierte las filas de Drift (PreguntaData) en entidades (Preguntas)
  List<Preguntas> _aEntidades(List<bd.PreguntaData> filas) {
    return filas
        .map(
          (fila) => Preguntas(
            preguntaId: fila.idPregunta,
            moduloId: fila.idModulo,
            pasoId: fila.idPaso,
            titulo: fila.titulo,
          ),
        )
        .toList();
  }
}