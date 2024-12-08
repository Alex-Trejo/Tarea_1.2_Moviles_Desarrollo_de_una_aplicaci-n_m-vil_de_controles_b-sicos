import 'package:flutter/material.dart';
import '../logica/logica_ejercicio3_mcd.dart'; // Importar la lógica de cálculo del MCD

class Ejercicio3Page extends StatefulWidget {
  const Ejercicio3Page({super.key});

  @override
  _Ejercicio3PageState createState() => _Ejercicio3PageState();
}

class _Ejercicio3PageState extends State<Ejercicio3Page> {
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  int? _resultado;
  bool _isLoading = false;
  String _errorMessage = ''; // Para mostrar el mensaje de error si no se puede calcular el MCD

  void _calcularMCD() {
    setState(() {
      _isLoading = true; // Activar el estado de carga mientras se calcula el MCD
      _errorMessage = ''; // Limpiar cualquier mensaje de error anterior
      _resultado = null; // Limpiar el resultado anterior
    });

    final numero1 = int.tryParse(_numero1Controller.text);
    final numero2 = int.tryParse(_numero2Controller.text);

    if (numero1 == null || numero2 == null || numero1 <= 0 || numero2 <= 0) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Por favor ingrese dos números enteros positivos.';
      });
      return;
    }

    // Calcular el MCD
    Future.delayed(const Duration(seconds: 1), () {
      try {
        final mcd = calcularMCD(numero1, numero2);
        setState(() {
          _resultado = mcd;
          _isLoading = false; // Desactivar el estado de carga cuando termine
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error al calcular el MCD: $e'; // Mostrar el mensaje de error
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
          'MCD - Ejercicio 3',
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
              'Calcula el MCD de dos números:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numero1Controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ingresa el primer número',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.blueGrey[700],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numero2Controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ingresa el segundo número',
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
              onPressed: _calcularMCD,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800],
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Calcular MCD',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const Center(child: CircularProgressIndicator()) // Mostrar carga mientras se calcula el MCD
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
                              'MCD: $_resultado',
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
