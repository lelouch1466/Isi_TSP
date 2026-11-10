class Pasos {
  final int pasoId;
  final int moduloId;
  final int numero;
  final String nombreLeccion;
  final bool bloqueado;
  final String tipoContenido;

  Pasos({
    required this.pasoId,
    required this.moduloId,
    required this.numero,
    required this.nombreLeccion,
    required this.bloqueado,
    required this.tipoContenido,
  });

  // reglas propias
  bool get disponible => !bloqueado;
  bool get esCuestionario => tipoContenido == 'cuestionario';
  bool get esTeoria => tipoContenido == 'teoria';

  @override
  String toString() {
    return 'Pasos(pasoId: $pasoId, moduloId: $moduloId, numero: $numero, '
        'nombreLeccion: $nombreLeccion, bloqueado: $bloqueado, '
        'tipoContenido: $tipoContenido)';
  }
}
