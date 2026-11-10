// Entidad del dominio: solo datos y reglas propias.
// No importa Flutter, Drift ni repositorios.
class Preguntas {
  final int preguntaId;
  final int moduloId;
  final int pasoId;
  final String titulo;

  Preguntas({
    required this.preguntaId,
    required this.moduloId,
    required this.pasoId,
    required this.titulo,
  });

  @override
  String toString() {
    return 'Preguntas(preguntaId: $preguntaId, moduloId: $moduloId, '
        'pasoId: $pasoId, titulo: $titulo)';
  }
}