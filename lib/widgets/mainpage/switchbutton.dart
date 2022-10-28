import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  final Color color;
  final bool value;
  final bool switchback;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.switchback,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  final double width = 65;
  final double height = 140;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.topCenter : Alignment.bottomCenter,
            end: widget.value ? Alignment.bottomCenter : Alignment.topCenter)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              border: widget.switchback ? null : Border.all(width: 1),
              borderRadius: BorderRadius.circular(31)),
          height: height,
          width: width,
          child: widget.switchback
              ? Image.asset(
                  'assets/images/switchback.png',
                  fit: BoxFit.fill,
                )
              : null),
      AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onVerticalDragDown:!widget.value? null
                : (DragDownDetails details) async {
                    // if (_animationController.isCompleted) {
                    //   await _animationController.reverse();
                    // } else {
                    //   await _animationController.forward();
                    // }
                    await _animationController.forward();

                    widget.value == false
                        ? widget.onChanged(true)
                        : widget.onChanged(false);
                    _animationController.reverse();
                  }, 
            onTap: !widget.value
                ? null
                : () async {
                    // if (_animationController.isCompleted) {
                    //   await _animationController.reverse();
                    // } else {
                    //   await _animationController.forward();
                    // }
                    await _animationController.forward();

                    widget.value == false
                        ? widget.onChanged(true)
                        : widget.onChanged(false);
                    _animationController.reverse();
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
                        widget.text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: widget.color,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}
