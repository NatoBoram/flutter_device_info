import "package:device_info/device_info.dart";
import "package:flutter/material.dart";
import 'package:flutter_device_info/device_data_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo _deviceData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Android Device Info"),
          ),
          body: _deviceData != null
              ? DeviceDataList(deviceData: _deviceData)
              : Center(child: Text("Loading...")),
        ),
      ),
    );
  }

  initDeviceData() async {
    _deviceData = await deviceInfoPlugin.androidInfo;
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDeviceData();
  }
}
