import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class UserToggleButton extends StatefulWidget {
  final double width;
  final DateTime birthdate;
  const UserToggleButton({
    super.key,
    required this.width,
    required this.birthdate,
  });

  @override
  State<UserToggleButton> createState() => _UserToggleButtonState();
}

class _UserToggleButtonState extends State<UserToggleButton> {
  @override
  Widget build(BuildContext context) {
    List<bool> selection =
        DateFormat.j().format(widget.birthdate).endsWith('AM')
            ? [true, false]
            : [false, true];
    const double height = 40;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: transparentwhite,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: ToggleButtons(
        fillColor: Colors.white10,
        selectedColor: Colors.white,
        color: maingrey,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        renderBorder: false,
        isSelected: selection,
        onPressed: (index) {
          selection = [false, false];
          setState(() {
            selection[index] = true;
          });
        },
        children: [
          Container(
            height: height,
            width: widget.width / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selection[0] ? mainblue : null),
            child: Center(
              child: Text('AM',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: selection[0] ? Colors.white : null)),
            ),
          ),
          Container(
            width: widget.width / 2,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selection[1] ? mainblue : null),
            child: Center(
              child: Text('PM',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: selection[1] ? Colors.white : null)),
            ),
          ),
        ],
      ),
    );
  }
}
