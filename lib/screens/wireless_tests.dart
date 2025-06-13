import 'package:flutter/material.dart';
import 'package:ruletaso/wireless/client.dart';
import 'package:ruletaso/wireless/host.dart';

class WirelessTest extends StatefulWidget {
  const WirelessTest({super.key});

  @override
  State<WirelessTest> createState() => _WirelessTestState();
}

class _WirelessTestState extends State<WirelessTest> {
  Host host = Host();
  UDPStart start = UDPStart();
  bool showInput = false;
  final TextEditingController nameController = TextEditingController();

  void _handleClientePressed() {
    setState(() {
      showInput = !showInput; // Alterna mostrar u ocultar el input
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Red'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MinimalButton(
              label: 'Host',
              onPressed: host.StartHostBroadcast,
            ),
            const SizedBox(height: 16),
            _MinimalButton(
              label: 'Cliente',
              onPressed: _handleClientePressed,
            ),
            if (showInput) ...[
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ingresa tu nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text.trim();
                  if (name.isNotEmpty) {
                    // Aquí puedes iniciar el cliente con el nombre
                    print('Nombre ingresado: $name');
                    start.start(name);
                    _handleClientePressed();
                  }
                },
                child: const Text('Conectar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MinimalButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _MinimalButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}
