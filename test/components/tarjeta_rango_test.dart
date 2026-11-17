import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isi_tsp/domain/entities/rango.dart';
import 'package:isi_tsp/presentation/components/tarjeta_rango.dart';

// Bundle de assets que nunca encuentra nada.
// Asi se simula que falta la imagen, aunque el png si exista en el proyecto.
class BundleSinImagenes extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    throw FlutterError('no existe: $key');
  }
}

// Pruebas de la tarjeta que muestra el rango en Records
void main() {
  // la tarjeta dentro de una pantalla minima, sin imagenes disponibles
  Widget pantallaConTarjeta(RangoJugador rangoJugador) {
    return MaterialApp(
      home: DefaultAssetBundle(
        bundle: BundleSinImagenes(),
        child: Scaffold(body: TarjetaRango(rangoJugador: rangoJugador)),
      ),
    );
  }

  testWidgets('muestra el nombre del rango y los puntos', (tester) async {
    await tester.pumpWidget(
      pantallaConTarjeta(RangoJugador(puntos: 75, rango: Rango.pro)),
    );

    expect(find.text("Pro"), findsOneWidget);
    expect(find.text("75 puntos"), findsOneWidget);
  });

  testWidgets('pide la imagen de su nivel', (tester) async {
    await tester.pumpWidget(
      pantallaConTarjeta(RangoJugador(puntos: 95, rango: Rango.legend)),
    );

    final Image imagen = tester.widget<Image>(find.byType(Image));
    final AssetImage asset = imagen.image as AssetImage;
    expect(asset.assetName, 'assets/images/level_5.jpg');
  });

  testWidgets('si falta la imagen muestra un icono generico', (tester) async {
    await tester.pumpWidget(
      pantallaConTarjeta(RangoJugador(puntos: 0, rango: Rango.noob)),
    );

    //se espera a que la carga de la imagen falle y se dibuje el icono
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump();

    expect(find.byIcon(Icons.emoji_events), findsOneWidget);
    expect(find.text("Noob"), findsOneWidget);
  });
}
