import 'package:udp/udp.dart';

void ListenerForHost() async {

  var receiver = await UDP.bind(Endpoint.any(port: Port(65001)));

  print('Cliente iniciado');
  receiver.asStream().listen((datagram) {
    if (datagram != null) {
      final hostIp = datagram.address;
      final message = String.fromCharCodes(datagram.data);
      print('Dispositivo destectado: $hostIp dice $message');
    }
  });
}