import 'dart:convert';

import 'package:ruletaso/models/client.dart';
import 'package:udp/udp.dart';

class Host {

  List<Client> clientes = [];



  void StartHostBroadcast() async {
    var socket = await UDP.bind(Endpoint.any(port: Port(65001)));
    print('Host iniciado');

    // Listen clients responses
    socket.asStream().listen((datagram) {
      if (datagram != null) {
        try {
          final mensaje = String.fromCharCodes(datagram.data);
          final Map<String, dynamic> data = jsonDecode(mensaje);

          final nuevoCliente = Client.fromJson(data);

          // Evitar duplicados por IP
          final yaExiste = clientes.any((c) => c.ip == nuevoCliente.ip);
          if (!yaExiste) {
            clientes.add(nuevoCliente);
            print('✅ Cliente agregado: ${nuevoCliente.name} (${nuevoCliente.ip})');
            print(clientes);
          }

          // Imprimir todos los clientes en la lista
          print('📋 Lista de clientes conectados:');
          clientes.forEach((c) {
            print('• ${c.name} (${c.ip})');
          });

        } catch (e) {
          print('❌ Error al parsear JSON: $e');
        }
      }
    });
  }


}
