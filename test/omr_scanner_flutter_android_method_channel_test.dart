import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omr_scanner_flutter_android/omr_scanner_flutter_android_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelOmrScannerFlutterAndroid platform = MethodChannelOmrScannerFlutterAndroid();
  const MethodChannel channel = MethodChannel('omr_scanner_flutter_android');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
