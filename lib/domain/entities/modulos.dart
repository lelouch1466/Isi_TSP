class Modulos {
  final int moduloId;
  final String nombre;
  final bool bloqueado;

  Modulos({
    required this.moduloId,
    required this.nombre,
    required this.bloqueado,
  });

  // regla propia: se puede entrar si no esta bloqueado
  bool get disponible => !bloqueado;

  @override
  String toString() {
    return 'Modulos(moduloId: $moduloId, nombre: $nombre, bloqueado: $bloqueado)';
  }
}
