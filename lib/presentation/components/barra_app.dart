import 'package:flutter/material.dart';
import 'package:isi_tsp/presentation/core/appcolors.dart';

class BarraApp {

  static AppBar barrita(String titulo) {
    
    return AppBar(
      backgroundColor: Appcolors.barraap,
      title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}