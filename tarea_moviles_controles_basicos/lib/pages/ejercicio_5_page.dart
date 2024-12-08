import 'package:flutter/material.dart';
import '../logica/logica_ejercicio5_primos.dart'; // Importar la lógica para generar números primos

class Ejercicio5Page extends StatefulWidget {
  const Ejercicio5Page({super.key});

  @override
  _Ejercicio5PageState createState() => _Ejercicio5PageState();
}

class _Ejercicio5PageState extends State<Ejercicio5Page> {
  List<int> _numerosPrimos = [];
  bool _isLoading = false;
  String _errorMessage = ''; // Para manejar posibles errores

  void _generarPrimos() {
    setState(() {
      _isLoading = true; // Activar estado de carga
      _errorMessage = ''; // Limpiar mensajes de error previos
      _numerosPrimos = []; // Reiniciar la lista de números primos
    });

    // Generar números primos (con retardo simulado)
    Future.delayed(const Duration(seconds: 2), () {
      try {
        final primos = generarNumerosPrimos();
        if (primos.isEmpty) {
          throw Exception('No se pudieron generar los números primos.');
        }
        setState(() {
          _numerosPrimos = primos;
          _isLoading = false; // Finalizar estado de carga
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error al generar números primos: $e'; // Mostrar error
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fondo oscuro suave
      appBar: AppBar(
        title: const Text(
          'Números Primos - Ejercicio 5',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Genera los números primos hasta 32,767:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generarPrimos,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800],
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Generar Primos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const Center(child: CircularProgressIndicator()) // Mostrar carga mientras se generan los primos
                : _errorMessage.isNotEmpty
                    ? Center(
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Mostrar 4 columnas
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1.5, // Relación de aspecto ajustada
                          ),
                          itemCount: _numerosPrimos.length,
                          itemBuilder: (context, index) {
                            final primo = _numerosPrimos[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 4.0,
                              color: Colors.blueGrey[700],
                              child: Center(
                                child: Text(
                                  primo.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
