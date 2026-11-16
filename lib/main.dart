import 'package:flutter/material.dart';
import 'package:isi_tsp/domain/musica/servicio_musica.dart';
import 'package:isi_tsp/inyeccion_dependencias.dart';
import 'package:isi_tsp/presentation/components/musica/observador_ciclo_musica.dart';
import 'package:isi_tsp/presentation/screens/glosario_screen.dart';
import 'package:isi_tsp/presentation/screens/home_isi.dart';
import 'package:isi_tsp/presentation/screens/teoria_screen.dart';

void main() {
  // El reproductor de musica necesita a Flutter listo antes de usarse
  WidgetsFlutterBinding.ensureInitialized();

  // Registra base de datos y repositorios antes de arrancar la app
  configurarDependencias();

  // Arranca la musica de fondo. No se espera con await para que la app
  // abra de inmediato aunque la cancion tarde en cargar
  getIt<ServicioMusica>().iniciar();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //envuelve todas las pantallas para pausar la musica al minimizar
      builder: (context, child) => ObservadorCicloMusica(child: child!),
      home: Scaffold(
        //body: QuestionScreen(),
        body: HomeIsi(),
        //body: GlosarioScreen(),
        //body: LeccionMap(),
        //body: TeoriaScreen(),
      ),
    );
  }
}
