import 'package:flutter/material.dart';

class OutdoorItem extends StatelessWidget {
  const OutdoorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, left: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "Outdoor",
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.red),
      ),
    );
  }
}
