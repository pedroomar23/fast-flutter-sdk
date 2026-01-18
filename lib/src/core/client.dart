import 'package:fast_sdk_client/src/core/location.dart';

class Client {
  final String ip;
  final String asn;
  final Location location;

  Client({required this.ip, required this.asn, required this.location});

  @override
  String toString() => 'Client{ip: $ip, asn: $asn, location: $location}';

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      ip: json['ip'] as String,
      asn: json['asn'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'ip': ip, 'asn': asn, 'location': location.toJson()};
  }
}
