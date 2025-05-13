import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'omr_scanner_flutter_android_platform_interface.dart';

/// An implementation of [OmrScannerFlutterAndroidPlatform] that uses method channels.
class MethodChannelOmrScannerFlutterAndroid extends OmrScannerFlutterAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('omr_scanner_flutter_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
