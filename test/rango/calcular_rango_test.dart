import 'package:flutter_test/flutter_test.dart';
import 'package:isi_tsp/domain/constants/modulos_constantes.dart';
import 'package:isi_tsp/domain/entities/rango.dart';
import 'package:isi_tsp/domain/usecases/calcular_rango.dart';

import 'puntaje_repositorio_falso.dart';

// Pruebas del caso de uso que suma los puntajes y da el rango
void main() {
  test('sin puntajes da 0 puntos y Noob', () async {
    final calcular = CalcularRango(PuntajeRepositorioFalso());

    final RangoJugador resultado = await calcular();

    expect(resultado.puntos, 0);
    expect(resultado.rango, Rango.noob);
  });

  test('suma cuestionarios y examenes', () async {
    final calcular = CalcularRango(
      PuntajeRepositorioFalso(
        cuestionarios: [cuestionario(1, 5), cuestionario(2, 4)],
        examenes: [examen(1, 15), examen(2, 10)],
      ),
    );

    final RangoJugador resultado = await calcular();

    //5 + 4 + 15 + 10 = 34
    expect(resultado.puntos, 34);
    expect(resultado.rango, Rango.amateur);
  });

  test('la racha de endless tambien cuenta', () async {
    final calcular = CalcularRango(
      PuntajeRepositorioFalso(
        cuestionarios: [cuestionario(1, 5)],
        examenes: [examen(1, 15), examen(moduloEndlessId, 12)],
      ),
    );

    final RangoJugador resultado = await calcular();

    //5 + 15 + 12 (endless) = 32
    expect(resultado.puntos, 32);
    expect(resultado.rango, Rango.amateur);
  });

  test('todo perfecto mas una racha de 10 en endless llega a God', () async {
    //9 cuestionarios de 5 = 45, 3 examenes de 15 = 45, endless 10
    final calcular = CalcularRango(
      PuntajeRepositorioFalso(
        cuestionarios: [for (int i = 1; i <= 9; i++) cuestionario(i, 5)],
        examenes: [
          examen(1, 15),
          examen(2, 15),
          examen(3, 15),
          examen(moduloEndlessId, 10),
        ],
      ),
    );

    final RangoJugador resultado = await calcular();

    expect(resultado.puntos, 100);
    expect(resultado.rango, Rango.god);
  });
}
