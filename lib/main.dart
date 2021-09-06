import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

import 'device_data_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final deviceInfoPlugin = DeviceInfoPlugin();

  AndroidDeviceInfo? _deviceData;

  @override
  void initState() {
    super.initState();
    initDeviceData();
  }

  Future<void> initDeviceData() async {
    _deviceData = await deviceInfoPlugin.androidInfo;
    if (!mounted) {
      return;
    }

    setState(() {});
  }

  @override
  Widget build(final BuildContext context) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Android Device Info'),
            ),
            body: _deviceData != null
                ? DeviceDataList(deviceData: _deviceData!)
                : const Center(child: Text('Loading...')),
          ),
        ),
      );
}
