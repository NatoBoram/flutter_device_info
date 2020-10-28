import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceDataTile extends StatelessWidget {
  final IconData icon;

  final String title;
  final String subtitle;
  DeviceDataTile({
    this.icon,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Clipboard.setData(ClipboardData(text: "$title : $subtitle"));

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: ListTile(
              leading: Icon(Icons.content_copy),
              title: Text("Copied"),
              subtitle: Text("$title : $subtitle"),
            ),
            action: SnackBarAction(
              label: "Ok",
              onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
            ),
          ),
        );
      },
    );
  }
}
