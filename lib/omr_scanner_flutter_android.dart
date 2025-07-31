import 'package:flutter/services.dart';

class OmrScannerFlutterAndroid {
  static const MethodChannel _channel =
      MethodChannel('omr_scanner_flutter_android');

  Future<String?> getPlatformVersion() async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> startScannerActivity(String rollNumber) async {
    await _channel.invokeMethod('startScannerActivity', {
      'rollNumber': rollNumber,
    });
  }
}
