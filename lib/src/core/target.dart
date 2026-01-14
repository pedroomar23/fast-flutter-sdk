import 'package:fast_sdk/src/core/location.dart';

class Target {
  final String name;
  final String url;
  final Location location;

  Target({required this.name, required this.url, required this.location});

  @override
  String toString() => 'Target{name: $name, url: $url, location: $location}';

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      name: ['name'] as String,
      url: ['url'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url, 'location': location.toJson()};
  }
}
