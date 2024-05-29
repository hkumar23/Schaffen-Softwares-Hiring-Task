import 'package:flutter/material.dart';

class OutdoorItem extends StatelessWidget {
  const OutdoorItem({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, left: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 239, 69, 111),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: const Color.fromARGB(255, 239, 69, 111)),
      ),
    );
  }
}
