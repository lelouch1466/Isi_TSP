// Contrato: dice QUE puede hacer la musica de fondo, no COMO se reproduce.
// La implementacion con just_audio esta en data/musica.
abstract class ServicioMusica {
  // carga la cancion, la pone en loop y empieza a sonar
  Future<void> iniciar();

  // si esta sonando la silencia; si esta silenciada la vuelve a sonar
  Future<void> alternarSilencio();

  // true si el usuario silencio la musica
  bool get estaSilenciado;

  // emite true/false cada vez que cambia el silencio
  // (para que el icono sea el mismo en todas las pantallas)
  Stream<bool> observarSilenciado();

  // se llama al minimizar la app: la musica se pausa
  Future<void> pausarPorSegundoPlano();

  // se llama al volver a la app: la musica sigue, solo si no estaba silenciada
  Future<void> reanudarDesdeSegundoPlano();

  // libera el reproductor (cuando la app ya no lo necesita)
  Future<void> liberar();
}
