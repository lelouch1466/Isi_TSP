import 'package:flutter/foundation.dart';

class Question {
  final String preguntaId;
  final String titulo;
  final Map<String,bool> opciones;

  Question({
    required this.preguntaId,
    required this.titulo,
    required this.opciones,
  });

  @override
  String toString() {
    return preguntaId;
  }
}
