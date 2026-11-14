import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class PuntajeRepositorio {
  // lee todos los puntajes con su modulo, nombre de leccion y puntaje
  Future<List<Puntajes>> obtenerPuntajes();

  // guarda el puntaje del paso solo si es mayor que el guardado
  Future<void> actualizarPuntaje(int moduloId, int pasoId, int puntaje);

  // lee los puntajes de examen de todos los modulos con su nombre
  Future<List<PuntajesExamen>> obtenerPuntajesExamen();

  // lee el puntaje del examen de un modulo (null si no existe)
  Future<int?> obtenerPuntajeExamen(int moduloId);

  // guarda el puntaje del examen solo si es mayor que el guardado
  Future<void> actualizarPuntajeExamen(int moduloId, int puntaje);
}