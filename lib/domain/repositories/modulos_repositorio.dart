import 'package:isi_tsp/domain/entities/modulos.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class ModulosRepositorio {
  // lee los modulos una sola vez
  Future<List<Modulos>> obtenerModulos();

  // emite la lista de modulos y una nueva cada vez que cambian
  Stream<List<Modulos>> observarModulos();

  // marca el modulo como desbloqueado
  Future<void> desbloquearModulo(int moduloId);

  // true si el siguiente modulo esta bloqueado, false si no,
  // null si el modulo enviado es el ultimo
  Future<bool?> siguienteModuloBloqueado(int moduloId);
}
