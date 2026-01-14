class Location {
  final String city;
  final String country;

  Location({required this.city, required this.country});

  @override
  String toString() => 'Location{city: $city, country: $country}';

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'city': city, 'country': country};
  }
}
