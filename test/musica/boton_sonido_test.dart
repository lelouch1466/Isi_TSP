import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';
import 'package:isi_tsp/presentation/components/musica/boton_sonido.dart';

import 'servicio_musica_falso.dart';

// Pruebas del boton de sonido de la barra de app
void main() {
  late ServicioMusicaFalso musica;

  // antes de cada prueba se registra el servicio falso en get_it
  setUp(() {
    musica = ServicioMusicaFalso();
    GetIt.instance.registerSingleton<ServicioMusica>(musica);
  });

  // y despues se limpia para que no afecte a la siguiente
  tearDown(() async {
    await GetIt.instance.reset();
  });

  // el boton dentro de una pantalla minima
  Widget pantallaConBoton() {
    return const MaterialApp(home: Scaffold(body: BotonSonido()));
  }

  testWidgets('al inicio muestra el icono de sonido prendido', (tester) async {
    await tester.pumpWidget(pantallaConBoton());

    expect(find.byIcon(Icons.volume_up), findsOneWidget);
    expect(find.byIcon(Icons.volume_off), findsNothing);
  });

  testWidgets('al tocarlo silencia y cambia el icono', (tester) async {
    await tester.pumpWidget(pantallaConBoton());

    await tester.tap(find.byType(BotonSonido));
    await tester.pump();

    expect(musica.vecesAlternar, 1);
    expect(find.byIcon(Icons.volume_off), findsOneWidget);
  });

  testWidgets('al tocarlo dos veces vuelve a sonar', (tester) async {
    await tester.pumpWidget(pantallaConBoton());

    await tester.tap(find.byType(BotonSonido));
    await tester.pump();
    await tester.tap(find.byType(BotonSonido));
    await tester.pump();

    expect(musica.vecesAlternar, 2);
    expect(find.byIcon(Icons.volume_up), findsOneWidget);
  });

  testWidgets('si ya estaba silenciado arranca con el icono apagado', (
    tester,
  ) async {
    //simula que el usuario silencio en otra pantalla
    await musica.alternarSilencio();

    await tester.pumpWidget(pantallaConBoton());

    expect(find.byIcon(Icons.volume_off), findsOneWidget);
  });
}
