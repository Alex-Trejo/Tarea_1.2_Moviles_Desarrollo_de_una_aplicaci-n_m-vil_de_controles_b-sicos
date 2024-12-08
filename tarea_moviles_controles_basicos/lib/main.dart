import 'package:flutter/material.dart';
import 'pages/home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 1.2',
      
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(), // Configura HomePage como página inicial
    );
  }
}
