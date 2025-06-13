import 'dart:convert';

import 'package:ruletaso/models/client.dart';
import 'package:ruletaso/wireless/wirelessTools.dart';
import 'package:udp/udp.dart';

class UDPStart {
  final UDPTask task = UDPTask();

  // Inicia el proceso de conexión al Host
  Future<void> start(String name) async {

    await task.init(); //Initialize instance UDP

    if (name.trim().isEmpty) {
      print('El nombre no puede estar vacío');
      return;
    }

    try {
      final hostAvile = await task.isHostAvile(port: task.port);
      if (hostAvile) {
        await task.setName(name);
        await task.senderData();
        await task.listenerForHost();
      }
    } catch (e) {
      print('Error al iniciar el cliente: $e');
    }
  }
}

class UDPTask {
  final WirelessTools tools = WirelessTools();
  final int port = 65001;

  late Client client;


  late String name;
  late String ip;

  late UDP udpCLient;

  Future<void> init() async {
    udpCLient = await UDP.bind(Endpoint.any(port: Port(port)));
  }

  //Verifica si hay host activo

  Future<bool>  isHostAvile({required int port, Duration timeout = const Duration(seconds: 2)}) async {

    //Send ping
    await udpCLient.send('Ping'.codeUnits, Endpoint.broadcast(port: Port(port)));

    try {
      final response = await udpCLient.asStream().first.timeout(timeout);
      if (response != null) {
        return true;
      }
    } catch(_) {
      print('Host is not found');
    }
    return false;
  }

  // Asigna el nombre y obtiene la IP local
  Future<void> setName(String newName) async {
    name = newName.trim();

    final localIp = await tools.getLocalIpAdress();
    if (localIp != null && localIp.isNotEmpty) {
      ip = localIp;
      client = Client(ip: ip, name: name); // Instancia creada aquí
    } else {
      throw Exception("No se pudo obtener la IP local");
    }
  }


  // Envia los datos al host
  Future<void> senderData() async {

    final jsonData = jsonEncode(client.toJson());
    await udpCLient.send(jsonData.codeUnits, Endpoint.broadcast(port: Port(port)));

    print('Datos enviados: $jsonData');
  }


  // Escucha los mensajes del host
  Future<void> listenerForHost() async {

    print('Cliente iniciado y escuchando...');
    udpCLient.asStream().listen((datagram) {
      if (datagram != null) {
        final hostIp = datagram.address;
        final message = String.fromCharCodes(datagram.data);
        print('Dispositivo detectado: $hostIp dice $message');
      }
    });
  }
}
