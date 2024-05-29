import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      // color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elit leo, maximus quis porttitor non, vulputate nec urna. Duis nec euismod risus. Aliquam sit amet convallis elit. Ut non lorem ante. Donec vitae arcu et erat ullamcorper vulputate ac in mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean non ultrices ligula, eget malesuada diam. Praesent consequat velit sed est aliquet, sit amet vehicula odio mollis. Aliquam nec odio massa.",
            // softWrap: true,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  height: 1.2,
                  fontSize: 15,
                ),
            maxLines: _isExpanded ? null : 5,
            overflow: _isExpanded ? null : TextOverflow.ellipsis,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? "Read less" : "Read more",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color.fromARGB(255, 239, 69, 111),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
