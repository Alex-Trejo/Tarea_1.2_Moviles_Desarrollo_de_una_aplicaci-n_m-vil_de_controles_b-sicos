import 'package:flutter/material.dart';
import '../logica/logica_ejercicio4_factorizacion.dart';

class Ejercicio4Page extends StatefulWidget {
  const Ejercicio4Page({super.key});

  @override
  _Ejercicio4PageState createState() => _Ejercicio4PageState();
}

class _Ejercicio4PageState extends State<Ejercicio4Page> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, int>> _factores = [];

  void _calcularFactorizacion() {
    final String input = _controller.text;

    // Validación: verificar si el valor ingresado es un número entero positivo
    final int? numero = int.tryParse(input);

    if (numero == null || numero <= 0) {
      // Si no es un número o es negativo, mostrar mensaje de advertencia
      _mostrarMensajeAdvertencia('Por favor, ingresa un número entero positivo.');
    } else {
      // Si la validación pasa, calcular la factorización
      setState(() {
        _factores = factorizarNumero(numero);
      });
    }
  }

  void _mostrarMensajeAdvertencia(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red, // Color rojo para advertencia
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fondo oscuro suave
      appBar: AppBar(
        title: const Text(
          'Factorización - Ejercicio 4',
          style: TextStyle(
            fontFamily: 'Roboto', // Fuente moderna y legible
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white, // Título blanco para un buen contraste
          ),
        ),
        backgroundColor: Colors.blueGrey[800], // Fondo más suave para la app bar
        elevation: 4, // Elevación suave para darle un toque moderno
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Introduce un número entero:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto blanco
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ejemplo: 120',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color(0xFFE8E8E8), // Fondo claro para el TextField
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularFactorizacion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800], // Botón con el mismo color que la app bar
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texto blanco para el botón
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Resultado:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto blanco
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _factores.length,
                itemBuilder: (context, index) {
                  final factor = _factores[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4.0,
                    color: Colors.blueGrey[700], // Fondo de la tarjeta
                    child: ListTile(
                      leading: const Icon(Icons.star, color: Colors.amber), // Icono dorado
                      title: Text(
                        'Factor ${factor['factor']} elevado a la potencia ${factor['potencia']}',
                        style: const TextStyle(color: Colors.white),
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
