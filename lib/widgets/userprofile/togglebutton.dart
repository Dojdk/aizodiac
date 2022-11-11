import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import 'package:provider/provider.dart';

import '../../providers/user.dart';

class UserToggleButton extends StatefulWidget {
  final double width;
  const UserToggleButton({
    super.key,
    required this.width,
  });

  @override
  State<UserToggleButton> createState() => _UserToggleButtonState();
}

class _UserToggleButtonState extends State<UserToggleButton> {
  late List<bool> _selection;
  @override
  void initState() {
    super.initState();
    final time =
        Provider.of<UserProvider>(context, listen: false).getuser.birthdate;
    if (DateFormat.j().format(time).endsWith('AM')) {
      _selection = [true, false];
    } else {
      _selection = [false, true];
    }
  }

  @override
  Widget build(BuildContext context) {
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
        isSelected: _selection,
        onPressed: (index) {
          _selection = [false, false];
          setState(() {
            _selection[index] = true;
          });
        },
        children: [
          Container(
            height: height,
            width: widget.width / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selection[0] ? mainblue : null),
            child: Center(
              child: Text('AM',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: _selection[0] ? Colors.white : null)),
            ),
          ),
          Container(
            width: widget.width / 2,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selection[1] ? mainblue : null),
            child: Center(
              child: Text('PM',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: _selection[1] ? Colors.white : null)),
            ),
          ),
        ],
      ),
    );
  }
}
