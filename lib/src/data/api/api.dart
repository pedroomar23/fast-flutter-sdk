import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fast_sdk/src/core/fast_speed.dart';
import 'package:fast_sdk/src/core/client.dart';
import 'package:fast_sdk/src/core/target.dart';

class FastAoi {
  Future<void> fastSpeed() async {
    final urlString = Uri.https(
      "https://api.fast.com",
      "/netflix/speedtest/v2?https=true&token=YXNkZmFzZGxmbnNkYWZoYXNkZmhrYWxm&urlCount=5",
    );
    final urlResponse = await http.get(urlString);
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
        print('❌ DEBUG: JSON Failure Response');
        break;
      default:
        print('❌ DEBUG: JSON FAILURE Response');
        break;
    }
  }
}
