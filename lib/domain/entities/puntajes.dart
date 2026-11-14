// Entidad del dominio: el puntaje guardado de un paso de cuestionario.
// No importa Flutter, Drift ni repositorios.
class Puntajes {
  final int puntajeId;
  final int moduloId;
  final int pasoId;
  final String nombreLeccion; //viene de la tabla pasos
  final int puntaje;

  Puntajes({
    required this.puntajeId,
    required this.moduloId,
    required this.pasoId,
    required this.nombreLeccion,
    required this.puntaje,
  });

  @override
  String toString() {
    return 'Puntajes(puntajeId: $puntajeId, moduloId: $moduloId, '
        'pasoId: $pasoId, nombreLeccion: $nombreLeccion, puntaje: $puntaje)';
  }
}