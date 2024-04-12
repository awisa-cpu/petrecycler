import 'package:flutter/material.dart';

class CustomSettingsOption extends StatelessWidget {
  const CustomSettingsOption({
    super.key,
    required this.text,
    required this.icon,
    this.trailingIcon,
    this.onPressed,
  });
  final String text;
  final IconData icon;
  final IconData? trailingIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          leading: Icon(icon),
          title: Text(text),
          trailing: Icon(trailingIcon ?? Icons.chevron_right),
        ),
        const Divider()
      ],
    );
  }
}
