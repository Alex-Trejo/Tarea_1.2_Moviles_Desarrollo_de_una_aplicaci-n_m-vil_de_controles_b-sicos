import 'package:flutter/material.dart';
import '../logica/logica_ejercicio1_ascii.dart'; // Asegúrate de importar la lógica de generación de la tabla ASCII

class Ejercicio1Page extends StatefulWidget {
  const Ejercicio1Page({super.key});

  @override
  _Ejercicio1PageState createState() => _Ejercicio1PageState();
}

class _Ejercicio1PageState extends State<Ejercicio1Page> {
  List<String> _tablaASCII = [];
  bool _isLoading = false;
  String _errorMessage = ''; // Para mostrar el mensaje de error si no se puede generar la tabla

  void _generarTablaASCII() {
    setState(() {
      _isLoading = true; // Activar el estado de carga mientras se genera la tabla
      _errorMessage = ''; // Limpiar cualquier mensaje de error anterior
    });

    // Generar la tabla ASCII con pausas
    Future.delayed(const Duration(seconds: 1), () {
      try {
        final tabla = generarTablaASCIIConPausa();
        if (tabla.isEmpty) {
          throw Exception('No se pudo generar la tabla ASCII');
        }
        setState(() {
          _tablaASCII = tabla;
          _isLoading = false; // Desactivar el estado de carga cuando termine
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error al generar la tabla ASCII: $e'; // Mostrar el mensaje de error
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
          'Tabla ASCII - Ejercicio 1',
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
              'Genera la tabla ASCII con pausas:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generarTablaASCII,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800],
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Generar Tabla ASCII',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const Center(child: CircularProgressIndicator()) // Mostrar carga mientras se genera
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
                            crossAxisCount: 2, // Mostrar en dos columnas
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 3, // Ajustar la relación de aspecto para una mejor visualización
                          ),
                          itemCount: _tablaASCII.length,
                          itemBuilder: (context, index) {
                            final item = _tablaASCII[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 4.0,
                              color: Colors.blueGrey[700],
                              child: ListTile(
                                leading: const Icon(Icons.font_download, color: Colors.amber),
                                title: Text(
                                  item,
                                  style: const TextStyle(color: Colors.white, fontSize: 12), // Reducir tamaño del texto
                                  overflow: TextOverflow.ellipsis, // Evitar corte de texto
                                  maxLines: 2, // Limitar a dos líneas de texto
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

