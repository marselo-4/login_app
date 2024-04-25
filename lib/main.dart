import 'package:flutter/material.dart';
import 'package:login_app/src/app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Esto quita la etiqueta de debug
    theme: ThemeData.dark(), // Esto pone la aplicación en modo oscuro
    home: App(),
  ));
}