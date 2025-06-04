import 'package:flutter/material.dart';

/// Página principal con botones para cambiar el color del tema
class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Challenge Screen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título
            Text(
              'Challenge',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 60),

            // Card de descripción
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.grey[200],
              child: SizedBox(
                width: 300,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Descripción del reto',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Acción para aceptar
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Aceptar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Acción para castigo
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text('Castigo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


