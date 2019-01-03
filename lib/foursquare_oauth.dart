import 'dart:async';

import 'package:flutter/services.dart';

class FoursquareOauth {
  static const MethodChannel _channel =
      const MethodChannel('com.matthewhuie.flutter.foursquare.oauth');

  static String authenticate(String clientId, String clientSecret)  {
    _channel.invokeMethod('authenticate', <String, String> {
      'clientId': clientId,
      'clientSecret': clientSecret
    });
  }
}
