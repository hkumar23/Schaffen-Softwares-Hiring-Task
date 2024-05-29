import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.itemColor,
    required this.title,
    required this.icon,
    super.key,
  });
  final Color itemColor;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: itemColor,
              ),
        ),
        leading: Icon(
          icon,
          color: itemColor,
        ),
      ),
    );
  }
}
