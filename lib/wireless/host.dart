import 'package:udp/udp.dart';

void StartHostBroadcast() async {

  var sender = await UDP.bind(Endpoint.any());
  print('Host iniciado');
  while (true) {
    await sender.send('Hello from host'.codeUnits, Endpoint.broadcast(port: Port(65001)));
    await Future.delayed(Duration(seconds: 2));
  }

}