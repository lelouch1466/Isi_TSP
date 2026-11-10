import 'package:isi_tsp/domain/entities/preguntas.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class PreguntaRepositorio {
  // lee las preguntas de un modulo y paso, ordenadas por id
  Future<List<Preguntas>> obtenerPreguntasPorModuloYPaso(
    int moduloId,
    int pasoId,
  );
}