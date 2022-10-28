import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class StandartAppBar extends StatelessWidget {
  final String iconname;
  final VoidCallback iconfunc;
  final MainAxisAlignment alignment;
  final double height;
  final double width;
  const StandartAppBar(
      {super.key,
      required this.iconname,
      required this.iconfunc,
      required this.alignment,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: iconfunc,
          icon: SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              'assets/icons/$iconname.svg',
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
