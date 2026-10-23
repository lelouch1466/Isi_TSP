import 'package:flutter/material.dart';
import 'package:isi_tsp/screens/home_isi.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Perritos malvados, perritos encarcelados"),
        ),
        body: HomeIsi(),

      ),
    );
  }
}
