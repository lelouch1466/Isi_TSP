import 'package:isi_tsp/domain/entities/pasos.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class PasosRepositorio {
  // lee los pasos de un modulo, ordenados por su numero
  Future<List<Pasos>> obtenerPasosPorModulo(int moduloId);

  // emite los pasos del modulo y una lista nueva cada vez que cambian
  Stream<List<Pasos>> observarPasosPorModulo(int moduloId);

  // marca el paso como desbloqueado
  Future<void> desbloquearPaso(int pasoId);
}