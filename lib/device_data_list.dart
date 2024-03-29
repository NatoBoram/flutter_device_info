import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

import 'device_data_tile.dart';

/// ListView containing all the properties from the device.
class DeviceDataList extends StatelessWidget {
  const DeviceDataList({
    required final this.deviceData,
    final Key? key,
  }) : super(key: key);

  final AndroidDeviceInfo deviceData;

  @override
  Widget build(final BuildContext context) => ListView(
        children: [
          DeviceDataTile(
            title: 'Security Patch',
            subtitle: deviceData.version.securityPatch ?? '',
          ),
          DeviceDataTile(
            title: 'SDK',
            subtitle: deviceData.version.sdkInt.toString(),
          ),
          DeviceDataTile(
            title: 'Release',
            subtitle: deviceData.version.release,
          ),
          DeviceDataTile(
            title: 'Preview SDK',
            subtitle: deviceData.version.previewSdkInt.toString(),
          ),
          DeviceDataTile(
            title: 'Incremental',
            subtitle: deviceData.version.incremental,
          ),
          DeviceDataTile(
            title: 'Codename',
            subtitle: deviceData.version.codename,
          ),
          DeviceDataTile(
            title: 'Base OS',
            subtitle: deviceData.version.baseOS ?? '',
          ),
          DeviceDataTile(
            title: 'Board',
            subtitle: deviceData.board,
          ),
          DeviceDataTile(
            title: 'Bootloader',
            subtitle: deviceData.bootloader,
          ),
          DeviceDataTile(
            title: 'Brand',
            subtitle: deviceData.brand,
          ),
          DeviceDataTile(
            title: 'Device',
            subtitle: deviceData.device,
          ),
          DeviceDataTile(
            title: 'Display',
            subtitle: deviceData.display,
          ),
          DeviceDataTile(
            title: 'Fingerprint',
            subtitle: deviceData.fingerprint,
          ),
          DeviceDataTile(
            title: 'Hardware',
            subtitle: deviceData.hardware,
          ),
          DeviceDataTile(
            title: 'Host',
            subtitle: deviceData.host,
          ),
          DeviceDataTile(
            title: 'ID',
            subtitle: deviceData.id,
          ),
          DeviceDataTile(
            title: 'Manufacturer',
            subtitle: deviceData.manufacturer,
          ),
          DeviceDataTile(
            title: 'Model',
            subtitle: deviceData.model,
          ),
          DeviceDataTile(
            title: 'Product',
            subtitle: deviceData.product,
          ),
          DeviceDataTile(
            title: 'Supported 32 Bit ABIs',
            subtitle: deviceData.supported32BitAbis.toString(),
          ),
          DeviceDataTile(
            title: 'Supported 64 Bit ABIs',
            subtitle: deviceData.supported64BitAbis.toString(),
          ),
          DeviceDataTile(
            title: 'Supported ABIs',
            subtitle: deviceData.supportedAbis.toString(),
          ),
          DeviceDataTile(
            title: 'Tags',
            subtitle: deviceData.tags,
          ),
          DeviceDataTile(
            title: 'Type',
            subtitle: deviceData.type,
          ),
          DeviceDataTile(
            title: 'Is Physical Device',
            subtitle: deviceData.isPhysicalDevice.toString(),
          ),
          DeviceDataTile(
            title: 'Android ID',
            subtitle: deviceData.androidId,
          ),
        ],
      );
}
