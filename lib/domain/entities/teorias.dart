// Entidad del dominio: una pagina de teoria de un paso.
// No importa Flutter, Drift ni repositorios.
class Teorias {
  final int teoriaId;
  final int moduloId;
  final int pasoId;
  final int pagina; //orden de la pagina dentro del paso (1, 2, 3...)
  final String escrito; //texto de la pagina

  Teorias({
    required this.teoriaId,
    required this.moduloId,
    required this.pasoId,
    required this.pagina,
    required this.escrito,
  });

  @override
  String toString() {
    return 'Teorias(teoriaId: $teoriaId, moduloId: $moduloId, '
        'pasoId: $pasoId, pagina: $pagina, escrito: $escrito)';
  }
}