// Entidad del dominio: un termino del glosario con su definicion.
// No importa Flutter, Drift ni repositorios.
class Glosarios {
  final int glosarioId;
  final String termino;
  final String descripcion;

  Glosarios({
    required this.glosarioId,
    required this.termino,
    required this.descripcion,
  });

  @override
  String toString() {
    return 'Glosarios(glosarioId: $glosarioId, termino: $termino, '
        'descripcion: $descripcion)';
  }
}