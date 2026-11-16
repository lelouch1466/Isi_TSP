import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/components/musica/boton_sonido.dart';

import '../musica/servicio_musica_falso.dart';

// Pruebas de la barra de app que usan todas las pantallas
void main() {
  // el boton de sonido pide el servicio a get_it, se registra uno falso
  setUp(() {
    GetIt.instance.registerSingleton<ServicioMusica>(ServicioMusicaFalso());
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  // una pantalla minima con la barra
  Widget pantallaConBarra(AppBar barra) {
    return MaterialApp(home: Scaffold(appBar: barra));
  }

  testWidgets('muestra el titulo y el boton de sonido', (tester) async {
    await tester.pumpWidget(pantallaConBarra(BarraApp.barrita("Home")));

    expect(find.text("Home"), findsOneWidget);
    expect(find.byType(BotonSonido), findsOneWidget);
  });

  testWidgets('las acciones extra van antes del boton de sonido', (
    tester,
  ) async {
    await tester.pumpWidget(
      pantallaConBarra(
        BarraApp.barrita("Cuestionario", acciones: [Text("Puntaje: 3")]),
      ),
    );

    expect(find.text("Puntaje: 3"), findsOneWidget);
    expect(find.byType(BotonSonido), findsOneWidget);

    //el puntaje queda a la izquierda del boton
    final double xPuntaje = tester.getCenter(find.text("Puntaje: 3")).dx;
    final double xBoton = tester.getCenter(find.byType(BotonSonido)).dx;
    expect(xPuntaje, lessThan(xBoton));
  });
}
