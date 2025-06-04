import 'package:flutter/material.dart';
import 'package:ruletaso/screens/challenge_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ruletaso')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Ruletaso',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple
              ),
            ),
            const SizedBox(height: 50),
            // Primer botón con ancho fijo
            SizedBox(
              width: 200, // Ancho fijo para uniformidad
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChallengeScreen())
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Para que el Row ocupe solo el espacio necesario
                  children: const [
                    Text('Iniciar'),
                    SizedBox(width: 8), // Espacio entre texto e ícono
                    Icon(Icons.start_rounded, size: 18),
                  ],
                ),

              ),
            ),

            const SizedBox(height: 50), // Espacio vertical entre botones
            // Segundo botón con el mismo ancho
            SizedBox(
              width: 200, // Mismo ancho para que se vean iguales
              child: ElevatedButton(
                onPressed: () {
                  // Acción vacía
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Agregar retos'),
                    SizedBox(width: 8),
                    Icon(Icons.add_circle_outline, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}