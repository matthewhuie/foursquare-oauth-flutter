import 'dart:async';

import 'package:flutter/services.dart';

class FoursquareOAuth {
  static const MethodChannel _channel =
      const MethodChannel('com.matthewhuie.flutter.foursquare.oauth');

  static Future<String> authenticate(String clientId, String clientSecret)  {
    return _channel.invokeMethod('authenticate', <String, String> {
      'clientId': clientId,
      'clientSecret': clientSecret
    });
  }
}
