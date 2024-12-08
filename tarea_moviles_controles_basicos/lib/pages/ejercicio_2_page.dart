import 'package:flutter/material.dart';
import '../logica/logica_ejercicio2_factorial.dart'; // Importar la lógica de cálculo del factorial

class Ejercicio2Page extends StatefulWidget {
  const Ejercicio2Page({super.key});

  @override
  _Ejercicio2PageState createState() => _Ejercicio2PageState();
}

class _Ejercicio2PageState extends State<Ejercicio2Page> {
  final TextEditingController _numeroController = TextEditingController();
  double? _resultado;
  bool _isLoading = false;
  String _errorMessage = ''; // Para mostrar el mensaje de error si no se puede calcular el factorial

  void _calcularFactorial() {
    setState(() {
      _isLoading = true; // Activar el estado de carga mientras se calcula el factorial
      _errorMessage = ''; // Limpiar cualquier mensaje de error anterior
      _resultado = null; // Limpiar el resultado anterior
    });

    final numero = int.tryParse(_numeroController.text);

    if (numero == null || numero < 0) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Por favor ingrese un número entero positivo.';
      });
      return;
    }

    // Calcular el factorial
    Future.delayed(const Duration(seconds: 1), () {
      try {
        final factorial = calcularFactorial(numero);
        setState(() {
          _resultado = factorial;
          _isLoading = false; // Desactivar el estado de carga cuando termine
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error al calcular el factorial: $e'; // Mostrar el mensaje de error
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
          'Factorial - Ejercicio 2',
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
              'Calcula el factorial de un número:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ingresa un número entero',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.blueGrey[700],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularFactorial,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800],
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Calcular Factorial',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const Center(child: CircularProgressIndicator()) // Mostrar carga mientras se calcula el factorial
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
                    : _resultado != null
                        ? Center(
                            child: Text(
                              'Resultado: ${_resultado!.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(), // No mostrar nada si no hay resultado
          ],
        ),
      ),
    );
  }
}
