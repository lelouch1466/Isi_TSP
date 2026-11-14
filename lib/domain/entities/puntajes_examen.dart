// Entidad del dominio: el puntaje guardado del examen de un modulo.
// No importa Flutter, Drift ni repositorios.
class PuntajesExamen {
  final int puntajeExamenId;
  final int moduloId;
  final String nombreModulo; //viene de la tabla modulos
  final int puntaje;

  PuntajesExamen({
    required this.puntajeExamenId,
    required this.moduloId,
    required this.nombreModulo,
    required this.puntaje,
  });

  @override
  String toString() {
    return 'PuntajesExamen(puntajeExamenId: $puntajeExamenId, '
        'moduloId: $moduloId, nombreModulo: $nombreModulo, puntaje: $puntaje)';
  }
}