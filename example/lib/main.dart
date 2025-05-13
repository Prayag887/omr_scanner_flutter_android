import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:omr_scanner_flutter_android/omr_scanner_flutter_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _omrScannerFlutterAndroidPlugin = OmrScannerFlutterAndroid();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _omrScannerFlutterAndroidPlugin.startScannerActivity();
                  } catch (e) {
                    debugPrint('Error launching AAR activity: $e');
                  }
                },
                child: const Text("Launch OMR Scanner"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
