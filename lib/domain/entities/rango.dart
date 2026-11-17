// Entidad del dominio: el rango del jugador segun su puntaje global.
// No importa Flutter, Drift ni repositorios.
//
// Es el unico lugar donde se definen los rangos y sus limites;
// si cambia algun limite o un nombre, se corrige aqui.
enum Rango {
  noob('Noob', 1, 0),
  amateur('Amateur', 2, 30),
  veterano('Veterano', 3, 50),
  pro('Pro', 4, 70),
  legend('Legend', 5, 90),
  god('God', 6, 100);

  // nombre que se muestra en pantalla
  final String nombre;

  // nivel del 1 al 6 (tambien decide la imagen level_X)
  final int nivel;

  // puntos minimos para tener este rango
  final int puntajeMinimo;

  const Rango(this.nombre, this.nivel, this.puntajeMinimo);

  // devuelve el rango que corresponde a los puntos.
  // se revisa del rango mas alto al mas bajo y se toma el primero que alcance
  static Rango desdePuntaje(int puntos) {
    for (final rango in Rango.values.reversed) {
      if (puntos >= rango.puntajeMinimo) return rango;
    }
    // puntos negativos (no deberia pasar): se toma el rango mas bajo
    return Rango.noob;
  }
}

// Entidad del dominio: los puntos totales del jugador junto con su rango.
// No importa Flutter, Drift ni repositorios.
class RangoJugador {
  final int puntos; //suma de cuestionarios, examenes y endless
  final Rango rango;

  RangoJugador({required this.puntos, required this.rango});

  @override
  String toString() {
    return 'RangoJugador(puntos: $puntos, rango: ${rango.nombre})';
  }
}
