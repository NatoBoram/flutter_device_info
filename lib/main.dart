import "dart:async";
import "dart:io";
import "package:device_info/device_info.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

void main() {
  runZoned(() {
    runApp(MyApp());
  }, onError: (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String _platform = "";
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  /// Initialize `_deviceData`
  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;
    String platform;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        platform = "Android";
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        platform = "iOS";
      } else {
        deviceData = <String, dynamic>{"Error": "Invalid Platform"};
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        "Error": "Failed to get platform version."
      };
    }

    // Whether this State object is currently in a tree.
    if (!mounted) return;

    // Notify the framework that the internal state of _platform and _deviceData has changed.
    setState(() {
      _platform = platform;
      _deviceData = deviceData;
    });
  }

  /// Load Android Device Info
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
    };
  }

  /// Load iOS Device Info
  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_platform + " Device Info"),
        ),
        body: ListView(
          children: _deviceData.keys.map((String property) {
            return ListTile(
              title: Text(property),
              subtitle: Text(
                "${_deviceData[property]}",
              ),
              onTap: () {
                
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
