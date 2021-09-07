import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ListTile with one line of information from the device.
class DeviceDataTile extends StatelessWidget {
  const DeviceDataTile({
    required final this.subtitle,
    required final this.title,
    final Key? key,
    final this.icon,
  }) : super(key: key);

  final IconData? icon;
  final String subtitle;
  final String title;

  Color _backgroundColor(final Brightness platformBrightness) {
    switch (platformBrightness) {
      case Brightness.light:
        return ThemeData.light().backgroundColor;

      case Brightness.dark:
        return ThemeData.dark().backgroundColor;
    }
  }

  Color _color(final Brightness platformBrightness) {
    switch (platformBrightness) {
      case Brightness.light:
        return ThemeData.light().iconTheme.color!;

      case Brightness.dark:
        return ThemeData.dark().iconTheme.color!;
    }
  }

  Color _textColor(final Brightness platformBrightness) {
    switch (platformBrightness) {
      case Brightness.light:
        return ThemeData.light().textTheme.button!.color!;

      case Brightness.dark:
        return ThemeData.dark().textTheme.button!.color!;
    }
  }

  @override
  Widget build(final BuildContext context) => ListTile(
        leading: icon != null ? Icon(icon) : null,
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          Clipboard.setData(ClipboardData(text: '$title : $subtitle'));

          final platformBrightness = MediaQuery.of(context).platformBrightness;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: _backgroundColor(platformBrightness),
              content: ListTile(
                leading: Icon(
                  Icons.content_copy,
                  color: _color(platformBrightness),
                ),
                title: const Text('Copied'),
                subtitle: Text('$title : $subtitle'),
              ),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
                textColor: _textColor(platformBrightness),
              ),
            ),
          );
        },
      );
}
