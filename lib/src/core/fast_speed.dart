import 'package:fast_sdk/src/core/client.dart';
import 'package:fast_sdk/src/core/target.dart';

class FastSpeed {
  final Client client;
  final List<Target> target;

  FastSpeed({required this.client, required this.target});

  @override
  String toString() => 'FastSpeed{client: $client, target: $target}';

  factory FastSpeed.fromJson(Map<String, dynamic> json) {
    return FastSpeed(
      client: json['client'] as Client, 
      target: json['target'] as List<Target>
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client': client.toJson(),
      'target': target.map((target) => target.toJson()).toList(),
    };
  }
}
