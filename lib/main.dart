import "package:device_info/device_info.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class DeviceDataTile extends StatelessWidget {
  DeviceDataTile({
    this.icon,
    @required this.title,
    @required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: "$title : $subtitle"));

        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: ListTile(
              leading: Icon(Icons.content_copy),
              title: Text("Copied"),
              subtitle: Text("$title : $subtitle"),
            ),
            action: SnackBarAction(
              label: "Ok",
              onPressed: Scaffold.of(context).hideCurrentSnackBar,
            ),
          ),
        );
      },
    );
  }
}

class DeviceDataList extends StatelessWidget {
  DeviceDataList({this.deviceData});

  final deviceData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DeviceDataTile(
          title: "Security Patch",
          subtitle: deviceData.version.securityPatch,
        ),
        DeviceDataTile(
          title: "SDK",
          subtitle: deviceData.version.sdkInt.toString(),
        ),
        DeviceDataTile(
          title: "Release",
          subtitle: deviceData.version.release,
        ),
        DeviceDataTile(
          title: "Preview SDK",
          subtitle: deviceData.version.previewSdkInt.toString(),
        ),
        DeviceDataTile(
          title: "Incremental",
          subtitle: deviceData.version.incremental,
        ),
        DeviceDataTile(
          title: "Codename",
          subtitle: deviceData.version.codename,
        ),
        DeviceDataTile(
          title: "Base OS",
          subtitle: deviceData.version.baseOS,
        ),
        DeviceDataTile(
          title: "Board",
          subtitle: deviceData.board,
        ),
        DeviceDataTile(
          title: "Bootloader",
          subtitle: deviceData.bootloader,
        ),
        DeviceDataTile(
          title: "Brand",
          subtitle: deviceData.brand,
        ),
        DeviceDataTile(
          title: "Device",
          subtitle: deviceData.device,
        ),
        DeviceDataTile(
          title: "Display",
          subtitle: deviceData.display,
        ),
        DeviceDataTile(
          title: "Fingerprint",
          subtitle: deviceData.fingerprint,
        ),
        DeviceDataTile(
          title: "Hardware",
          subtitle: deviceData.hardware,
        ),
        DeviceDataTile(
          title: "Host",
          subtitle: deviceData.host,
        ),
        DeviceDataTile(
          title: "ID",
          subtitle: deviceData.id,
        ),
        DeviceDataTile(
          title: "Manufacturer",
          subtitle: deviceData.manufacturer,
        ),
        DeviceDataTile(
          title: "Model",
          subtitle: deviceData.model,
        ),
        DeviceDataTile(
          title: "Product",
          subtitle: deviceData.product,
        ),
        DeviceDataTile(
          title: "Supported 32 Bit Abis",
          subtitle: deviceData.supported32BitAbis.toString(),
        ),
        DeviceDataTile(
          title: "Supported 64 Bit Abis",
          subtitle: deviceData.supported64BitAbis.toString(),
        ),
        DeviceDataTile(
          title: "Supported Abis",
          subtitle: deviceData.supportedAbis.toString(),
        ),
        DeviceDataTile(
          title: "Tags",
          subtitle: deviceData.tags,
        ),
        DeviceDataTile(
          title: "Type",
          subtitle: deviceData.type,
        ),
        DeviceDataTile(
          title: "Is Physical Device",
          subtitle: deviceData.isPhysicalDevice.toString(),
        ),
        DeviceDataTile(
          title: "Android ID",
          subtitle: deviceData.androidId,
        ),
      ],
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
      // theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android Device Info"),
        ),
        body: _deviceData != null
            ? DeviceDataList(deviceData: _deviceData)
            : [Center(child: Text("Loading..."))],
      ),
    );
  }
}
