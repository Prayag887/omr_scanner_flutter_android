import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'omr_scanner_flutter_android_method_channel.dart';

abstract class OmrScannerFlutterAndroidPlatform extends PlatformInterface {
  /// Constructs a OmrScannerFlutterAndroidPlatform.
  OmrScannerFlutterAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static OmrScannerFlutterAndroidPlatform _instance = MethodChannelOmrScannerFlutterAndroid();

  /// The default instance of [OmrScannerFlutterAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelOmrScannerFlutterAndroid].
  static OmrScannerFlutterAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OmrScannerFlutterAndroidPlatform] when
  /// they register themselves.
  static set instance(OmrScannerFlutterAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
