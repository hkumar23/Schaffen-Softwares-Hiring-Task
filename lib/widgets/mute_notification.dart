import 'package:flutter/material.dart';

class MuteNotification extends StatefulWidget {
  const MuteNotification({
    super.key,
  });

  @override
  State<MuteNotification> createState() => _MuteNotificationState();
}

class _MuteNotificationState extends State<MuteNotification> {
  bool _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        title: Text(
          "Mute Notification",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Switch(
          value: _isSwitchOn,
          onChanged: (value) {
            setState(() {
              _isSwitchOn = value;
            });
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
