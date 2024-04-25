import 'package:flutter/material.dart';
import 'package:login_app/src/screens/login_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
 }
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
    title: 'Iniciar Sesión',
      home: Scaffold(
        body: LoginScreen(),
      )
   );
  }
}