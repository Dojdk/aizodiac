import 'package:flutter/material.dart';

class EnterSwitch extends StatefulWidget {
  final Function onTap;

  const EnterSwitch({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<EnterSwitch> createState() => _EnterSwitchState();
}

class _EnterSwitchState extends State<EnterSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  final double width = 50;
  final double height = 100;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _circleAnimation =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInCubic));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(31)),
            height: height,
            width: width,
            child: Image.asset(
              'assets/images/switchback.png',
              fit: BoxFit.fill,
            )),
        AnimatedBuilder(
          animation: _animationController,
          child: Container(
            width: 45,
            height: 45,
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
          ),
          builder: (context, child) {
            return GestureDetector(
              onVerticalDragDown: (DragDownDetails details) async {
                await _animationController.forward();
                _animationController.reverse();
                widget.onTap();
              },
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31.0), color: null),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 4.0),
                  child: Align(
                    alignment: _circleAnimation.value,
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
