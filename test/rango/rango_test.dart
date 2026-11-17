import 'package:flutter_test/flutter_test.dart';
import 'package:isi_tsp/domain/entities/rango.dart';

// Pruebas de los limites de cada rango
void main() {
  // puntos -> rango esperado (las orillas de cada rango)
  final Map<int, Rango> casos = {
    -5: Rango.noob,
    0: Rango.noob,
    29: Rango.noob,
    30: Rango.amateur,
    49: Rango.amateur,
    50: Rango.veterano,
    69: Rango.veterano,
    70: Rango.pro,
    89: Rango.pro,
    90: Rango.legend,
    99: Rango.legend,
    100: Rango.god,
    150: Rango.god,
  };

  casos.forEach((puntos, esperado) {
    test('$puntos puntos es ${esperado.nombre}', () {
      expect(Rango.desdePuntaje(puntos), esperado);
    });
  });

  test('los niveles van del 1 al 6 en orden', () {
    expect(Rango.values.map((r) => r.nivel).toList(), [1, 2, 3, 4, 5, 6]);
  });

  test('los nombres son los que se muestran en pantalla', () {
    expect(Rango.values.map((r) => r.nombre).toList(), [
      'Noob',
      'Amateur',
      'Veterano',
      'Pro',
      'Legend',
      'God',
    ]);
  });
}
