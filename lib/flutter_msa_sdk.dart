import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterMsaSdk {
  static const MethodChannel _channel = const MethodChannel('flutter_msa_sdk');

  static Future<String> getOAID() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return await _channel.invokeMethod<String>('getOAID') ?? "";
    } else {
      return "";
    }
  }

  static Future<bool> isSupport() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return await _channel.invokeMethod<bool>('isSupport') ?? false;
    } else {
      return false;
    }
  }
}
