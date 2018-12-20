import 'dart:async';

import 'package:flutter/services.dart';

class FoursquareOauth {
  static const MethodChannel _channel =
      const MethodChannel('foursquare_oauth');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
