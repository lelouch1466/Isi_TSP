import 'package:flutter/material.dart';
import 'package:isi_tsp/inyeccion_dependencias.dart';
import 'package:isi_tsp/presentation/screens/home_isi.dart';
import 'package:isi_tsp/presentation/screens/teoria_screen.dart';

void main() {
  // Registra base de datos y repositorios antes de arrancar la app
  configurarDependencias();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //body: QuestionScreen(),
        body: HomeIsi(),
        //body: LeccionMap(),
        //body: TeoriaScreen(),
      ),
    );
  }
}
