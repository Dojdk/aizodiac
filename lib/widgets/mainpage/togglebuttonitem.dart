import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ToggleButtonItem extends StatelessWidget {
  final bool selected;
  final double height;
  final double width;
  final String text;
  final String subtext;
  const ToggleButtonItem(
      {super.key,
      required this.selected,
      required this.height,
      required this.width, required this.text, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? mainblue : null),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: selected ? Colors.white : null)),
          Text(subtext,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: selected ? Colors.white : mainblue)),
        ],
      ),
    );
  }
}
