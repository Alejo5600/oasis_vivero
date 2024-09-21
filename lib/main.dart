// main.dart
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivero App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green, // Asegúrate de definir el color primario
          onPrimary: Colors.white, // Color del texto en el AppBar
          secondary: Colors.greenAccent, // Color secundario opcional
          ),
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Lista de plantas'),
        '/about': (context) => const AboutPage(),
        //'/contact': (context) => ContactPage(),
      },
    );
  }
}
