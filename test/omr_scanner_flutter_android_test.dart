import 'package:flutter_test/flutter_test.dart';
import 'package:omr_scanner_flutter_android/omr_scanner_flutter_android.dart';
import 'package:omr_scanner_flutter_android/omr_scanner_flutter_android_platform_interface.dart';
import 'package:omr_scanner_flutter_android/omr_scanner_flutter_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOmrScannerFlutterAndroidPlatform
    with MockPlatformInterfaceMixin
    implements OmrScannerFlutterAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OmrScannerFlutterAndroidPlatform initialPlatform = OmrScannerFlutterAndroidPlatform.instance;

  test('$MethodChannelOmrScannerFlutterAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOmrScannerFlutterAndroid>());
  });

  test('getPlatformVersion', () async {
    OmrScannerFlutterAndroid omrScannerFlutterAndroidPlugin = OmrScannerFlutterAndroid();
    MockOmrScannerFlutterAndroidPlatform fakePlatform = MockOmrScannerFlutterAndroidPlatform();
    OmrScannerFlutterAndroidPlatform.instance = fakePlatform;

    expect(await omrScannerFlutterAndroidPlugin.getPlatformVersion(), '42');
  });
}
