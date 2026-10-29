import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/screens/home_isi.dart';
import 'package:isi_tsp/presentation/screens/question_screen.dart';

void main() {
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

      ),
    );
  }
}
