import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';
import 'package:isi_tsp/presentation/components/musica/observador_ciclo_musica.dart';

import 'servicio_musica_falso.dart';

// Pruebas del observador que pausa la musica al minimizar la app
void main() {
  late ServicioMusicaFalso musica;

  setUp(() {
    musica = ServicioMusicaFalso();
    GetIt.instance.registerSingleton<ServicioMusica>(musica);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  // cada prueba empieza con la app en pantalla, aunque la anterior
  // la haya dejado minimizada
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized()
        .handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  });

  // la app "envuelta" igual que en main.dart
  Widget appConObservador() {
    return MaterialApp(
      builder: (context, child) => ObservadorCicloMusica(child: child!),
      home: const Scaffold(body: Text("pantalla")),
    );
  }

  // la app siempre pasa por "inactive" antes de ocultarse o mostrarse
  void minimizar(WidgetTester tester) {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
  }

  void volver(WidgetTester tester) {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  }

  testWidgets('muestra la pantalla que envuelve', (tester) async {
    await tester.pumpWidget(appConObservador());

    expect(find.text("pantalla"), findsOneWidget);
  });

  testWidgets('al minimizar pausa la musica', (tester) async {
    await tester.pumpWidget(appConObservador());

    minimizar(tester);

    expect(musica.vecesPausar, 1);
    expect(musica.vecesReanudar, 0);
  });

  testWidgets('al volver reanuda la musica', (tester) async {
    await tester.pumpWidget(appConObservador());

    minimizar(tester);
    volver(tester);

    expect(musica.vecesPausar, 1);
    expect(musica.vecesReanudar, 1);
  });

  testWidgets('al cerrar deja de escuchar el ciclo de la app', (tester) async {
    await tester.pumpWidget(appConObservador());

    //se quita el observador de la pantalla
    await tester.pumpWidget(const SizedBox());
    minimizar(tester);

    expect(musica.vecesPausar, 0);
  });
}
