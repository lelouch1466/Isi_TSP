// Entidad del dominio: una opcion de respuesta de una pregunta.
// No importa Flutter, Drift ni repositorios.
class PreguntaOpcion {
  final int opcionId;
  final int preguntaId;
  final int moduloId;
  final int pasoId;
  final String respuesta; //texto de la opcion
  final bool esCorrecta; //true = es la respuesta correcta (columna valor)

  PreguntaOpcion({
    required this.opcionId,
    required this.preguntaId,
    required this.moduloId,
    required this.pasoId,
    required this.respuesta,
    required this.esCorrecta,
  });

  @override
  String toString() {
    return 'PreguntaOpcion(opcionId: $opcionId, preguntaId: $preguntaId, '
        'moduloId: $moduloId, pasoId: $pasoId, respuesta: $respuesta, '
        'esCorrecta: $esCorrecta)';
  }
}