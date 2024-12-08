import 'package:flutter/material.dart';
import 'ejercicio_1_page.dart';
import 'ejercicio_2_page.dart';
import 'ejercicio_3_page.dart';
import 'ejercicio_4_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fondo oscuro suave
      appBar: AppBar(
        title: const Text(
          'Menú de Ejercicios',
          style: TextStyle(
            fontFamily: 'Roboto', // Usamos una fuente moderna y legible
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,  // Título blanco para un buen contraste
          ),
        ),
        backgroundColor: Colors.blueGrey[800],  // Fondo más suave para la app bar
        elevation: 4, // Elevación suave para darle un toque moderno
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del grupo y autor
            
            const SizedBox(height: 16),
            // GridView de ejercicios
            GridView.count(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, 
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: [
                _buildMenuCard(
                  context,
                  title: 'Ejercicio 1',
                  description: 'Tabla ASCII',
                  icon: Icons.font_download,
                  page: const Ejercicio1Page(),
                ),
                _buildMenuCard(
                  context,
                  title: 'Ejercicio 2',
                  description: 'Factorial de un número',
                  icon: Icons.exposure,
                  page: const Ejercicio2Page(),
                ),
                _buildMenuCard(
                  context,
                  title: 'Ejercicio 3',
                  description: 'MCD de dos números',
                  icon: Icons.functions,
                  page: const Ejercicio3Page(),
                ),
                _buildMenuCard(
                  context,
                  title: 'Ejercicio 4',
                  description: 'Factorización de un número',
                  icon: Icons.calculate,
                  page: Ejercicio4Page(),
                ),
                _buildMenuCard(
                  context,
                  title: 'Ejercicio 5',
                  description: 'Numeros primos',
                  icon: Icons.functions,
                  page: Scaffold(
                    appBar: AppBar(title: const Text('Ejercicio 5')),
                    body: const Center(child: Text('Ejercicio 5 en desarrollo...')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 8.0,  // Elevación más suave
        color: Colors.blueGrey[700], // Color suave de fondo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0, color: Colors.amber), // Icono dorado
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto blanco
                fontFamily: 'Roboto', // Fuente más moderna
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white70, // Texto blanco suave
              ),
            ),
          ],
        ),
      ),
    );
  }
}
