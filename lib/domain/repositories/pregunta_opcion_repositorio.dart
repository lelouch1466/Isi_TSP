import 'package:isi_tsp/domain/entities/pregunta_opcion.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class PreguntaOpcionRepositorio {
  // lee las opciones de una pregunta, ordenadas por id
  Future<List<PreguntaOpcion>> obtenerOpcionesPorPregunta(int preguntaId);
}