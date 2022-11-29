import 'package:flutter/material.dart';
import 'package:locadora/screens/carros/cadastroCarros.dart';
import 'database/app_database.dart';
import 'models/carros.dart';
import 'screens/carros/listaDeCarros.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(
    Banco(),
  );
}

class Banco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff000000),
          brightness: Brightness.light,
          primary: Colors.yellow[600],
          secondary: Color(0xFF4C4C4D),
        ),
      ),
      home: Dashboard(),
    );
  }
}