class Client {
  String ip;
  String name;

  Client({required this.ip, required this.name});

  bool isValid() => ip.isNotEmpty && name.isNotEmpty;

  Map<String, dynamic> toJson() => {
    'ip': ip,
    'name': name,
  };

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      ip: json['ip'],
      name: json['name'],
    );
  }
}
