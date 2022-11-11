import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/index.dart';

import 'togglebuttonitem.dart';

import '../../constants/colors.dart';

class MainToggleButton extends StatefulWidget {
  final Function func;
  const MainToggleButton({
    super.key,
    required this.func,
  });

  @override
  State<MainToggleButton> createState() => _MainToggleButtonState();
}

class _MainToggleButtonState extends State<MainToggleButton> {
  List<bool> _selection = [true, false, false];

  Widget heart(bool selected) => SvgPicture.asset(
        'assets/icons/hearticon.svg',
        height: 10,
        color: selected ? mainpink : null,
      );

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 40) / 3;
    const double height = 60;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: transparentwhite,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: ToggleButtons(
        fillColor: Colors.white12,
        selectedColor: Colors.white,
        color: maingrey,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        renderBorder: false,
        isSelected: _selection,
        onPressed: (index) {
          _selection = [false, false, false];
          setState(() {
            Provider.of<Index>(context, listen: false).changeindex(index);
            _selection[index] = true;
          });
          if (index == 2) {
            widget.func(DateTime.now());
          }
        },
        children: [
          ToggleButtonItem(
              selected: _selection[0],
              height: height,
              width: width,
              text: 'CASUAL',
              subtext: '1 credit'),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selection[1] ? mainblue : null),
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    heart(_selection[1]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('LOVE',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: _selection[1] ? Colors.white : null)),
                    const SizedBox(
                      width: 10,
                    ),
                    heart(_selection[1]),
                  ],
                ),
                Text('0 credit',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: _selection[1] ? Colors.white : mainblue)),
              ],
            ),
          ),
          ToggleButtonItem(
              selected: _selection[2],
              height: height,
              width: width,
              text: 'ASK AI',
              subtext: '0 credit'),
        ],
      ),
    );
  }
}
