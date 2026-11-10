// Se importa con prefijo "bd" por consistencia con los demas repositorios
// y para no mezclar las clases de Drift con las entidades del dominio.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/pregunta_opcion.dart';
import 'package:isi_tsp/domain/repositories/pregunta_opcion_repositorio.dart';

// Implementacion del contrato usando Drift.
class PreguntaOpcionRepositorioImpl implements PreguntaOpcionRepositorio {
  final bd.AppDatabase _baseDatos;

  PreguntaOpcionRepositorioImpl(this._baseDatos);

  @override
  Future<List<PreguntaOpcion>> obtenerOpcionesPorPregunta(
    int preguntaId,
  ) async {
    final List<bd.PreguntaOpcionData> filas = await _baseDatos
        .obtenerOpcionesPorPregunta(preguntaId);
    return _aEntidades(filas);
  }

  // Convierte las filas de Drift (PreguntaOpcionData) en entidades
  List<PreguntaOpcion> _aEntidades(List<bd.PreguntaOpcionData> filas) {
    return filas
        .map(
          (fila) => PreguntaOpcion(
            opcionId: fila.idOpcion,
            preguntaId: fila.idPregunta,
            moduloId: fila.idModulo,
            pasoId: fila.idPaso,
            respuesta: fila.respuesta,
            esCorrecta: fila.valor,
          ),
        )
        .toList();
  }
}