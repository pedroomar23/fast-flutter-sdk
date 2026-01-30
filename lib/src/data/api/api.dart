import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fast_sdk_client/src/core/fast_speed.dart';
import 'package:fast_sdk_client/src/core/client.dart';
import 'package:fast_sdk_client/src/core/target.dart';
import 'package:fast_sdk_client/src/data/network/network.dart';

class FastApi {
  // Factory Constructor -> Patrón Singlenton
  FastApi._internal();
  static final FastApi _intance = FastApi._internal();
  factory FastApi() => _intance;

  Future<void> fastSpeed() async {
    final unknowStatus = NetworkError.statusCode;
    final client = http.Client();
    final urlString = Uri.https(
      "https://api.fast.com",
      "/netflix/speedtest/v2?https=true&token=YXNkZmFzZGxmbnNkYWZoYXNkZmhrYWxm&urlCount=5",
    );
    final urlResponse = await client.get(urlString);
    print('✅ DEBUG: Server Response: ${urlResponse.statusCode}');

    switch (urlResponse.statusCode) {
      case 200:
        final json = jsonDecode(urlResponse.body) as Map<String, dynamic>;
        final fastSpeed = FastSpeed(
          client: Client.fromJson(json['client'] as Map<String, dynamic>),
          target: (json['target'] as List<dynamic>)
              .map((e) => Target.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        print('✅ DEBUG: JSON Response: ${fastSpeed.toJson()}');
        break;
      case 400:
        print('❌ DEBUG: JSON Failure Response: ${unknowStatus}');
        break;
      default:
        print('❌ DEBUG: JSON FAILURE Response');
        break;
    }
  }
}
