import "package:device_info/device_info.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class DeviceDataTile extends StatelessWidget {
  DeviceDataTile({
    @required this.title,
    @required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class _MyAppState extends State<MyApp> {
  static final deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo _deviceData;

  @override
  void initState() {
    super.initState();
    initDeviceData();
  }

  initDeviceData() async {
    _deviceData = await deviceInfoPlugin.androidInfo;
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android Device Info"),
        ),
        body: ListView(
          children: _deviceData != null
              ? [
                  DeviceDataTile(
                    title: "Security Patch",
                    subtitle: _deviceData.version.securityPatch,
                  ),
                  DeviceDataTile(
                    title: "SDK",
                    subtitle: _deviceData.version.sdkInt.toString(),
                  ),
                  DeviceDataTile(
                    title: "Release",
                    subtitle: _deviceData.version.release,
                  ),
                  DeviceDataTile(
                    title: "Preview SDK",
                    subtitle: _deviceData.version.previewSdkInt.toString(),
                  ),
                  DeviceDataTile(
                    title: "Incremental",
                    subtitle: _deviceData.version.incremental,
                  ),
                  DeviceDataTile(
                    title: "Codename",
                    subtitle: _deviceData.version.codename,
                  ),
                  DeviceDataTile(
                    title: "Base OS",
                    subtitle: _deviceData.version.baseOS,
                  ),
                  DeviceDataTile(
                    title: "Board",
                    subtitle: _deviceData.board,
                  ),
                  DeviceDataTile(
                    title: "Bootloader",
                    subtitle: _deviceData.bootloader,
                  ),
                  DeviceDataTile(
                    title: "Brand",
                    subtitle: _deviceData.brand,
                  ),
                  DeviceDataTile(
                    title: "Device",
                    subtitle: _deviceData.device,
                  ),
                  DeviceDataTile(
                    title: "Display",
                    subtitle: _deviceData.display,
                  ),
                  DeviceDataTile(
                    title: "Fingerprint",
                    subtitle: _deviceData.fingerprint,
                  ),
                  DeviceDataTile(
                    title: "Hardware",
                    subtitle: _deviceData.hardware,
                  ),
                  DeviceDataTile(
                    title: "Host",
                    subtitle: _deviceData.host,
                  ),
                  DeviceDataTile(
                    title: "ID",
                    subtitle: _deviceData.id,
                  ),
                  DeviceDataTile(
                    title: "Manufacturer",
                    subtitle: _deviceData.manufacturer,
                  ),
                  DeviceDataTile(
                    title: "Model",
                    subtitle: _deviceData.model,
                  ),
                  DeviceDataTile(
                    title: "Product",
                    subtitle: _deviceData.product,
                  ),
                  DeviceDataTile(
                    title: "Supported 32 Bit Abis",
                    subtitle: _deviceData.supported32BitAbis.toString(),
                  ),
                  DeviceDataTile(
                    title: "Supported 64 Bit Abis",
                    subtitle: _deviceData.supported64BitAbis.toString(),
                  ),
                  DeviceDataTile(
                    title: "Supported Abis",
                    subtitle: _deviceData.supportedAbis.toString(),
                  ),
                  DeviceDataTile(
                    title: "Tags",
                    subtitle: _deviceData.tags,
                  ),
                  DeviceDataTile(
                    title: "Type",
                    subtitle: _deviceData.type,
                  ),
                  DeviceDataTile(
                    title: "Is Physical Device",
                    subtitle: _deviceData.isPhysicalDevice.toString(),
                  ),
                  DeviceDataTile(
                    title: "Android ID",
                    subtitle: _deviceData.androidId,
                  ),
                ]
              : [Center(child: Text("Loading..."))],
        ),
      ),
    );
  }
}
