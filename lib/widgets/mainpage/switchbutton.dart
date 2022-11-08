import 'package:flutter/material.dart';

import 'package:action_slider/action_slider.dart';

class CustomSwitch extends StatelessWidget {
  final String text;
  final Color color;
  final bool value;
  final bool switchback;
  final Function onTap;

  CustomSwitch({
    Key? key,
    required this.value,
    required this.switchback,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final _controller = ActionSliderController();
  final double width = 65;
  final double height = 140;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: switchback ? null : Border.all(width: 1),
              borderRadius: BorderRadius.circular(31)),
          height: height,
          width: width,
          child: switchback
              ? Image.asset(
                  'assets/images/switchback.png',
                  fit: BoxFit.fill,
                )
              : Align(
                  alignment:
                      value ? Alignment.topCenter : Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x40000000),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3))
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: color,
                            ),
                      ),
                    ),
                  ),
                ),
        ),
        if (switchback)
          RotatedBox(
            quarterTurns: 1,
            child: ActionSlider.custom(
              height: width,
              width: height,
              controller: _controller,
              backgroundColor: Colors.transparent,
              boxShadow: const [],
              action: (controller) {
                if (!switchback) {
                  return;
                }
                onTap();
              },
              foregroundBuilder: (p0, p1, p2) => RotatedBox(
                quarterTurns: -1,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x40000000),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3))
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: color,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        // if (!switchback)
        //   Container(
        //     width: 60,
        //     height: 60,
        //     decoration: const BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //             color: Color(0x40000000),
        //             spreadRadius: 2,
        //             blurRadius: 2,
        //             offset: Offset(0, 3))
        //       ],
        //       shape: BoxShape.circle,
        //       color: Colors.white,
        //     ),
        //     child: Center(
        //       child: Text(
        //         text,
        //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //               color: color,
        //             ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
