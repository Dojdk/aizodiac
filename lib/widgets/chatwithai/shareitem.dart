import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ShareItem extends StatelessWidget {
  final VoidCallback func;
  final String iconurl;
  const ShareItem({super.key, required this.func, required this.iconurl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: func,
        icon: SvgPicture.asset(
          'assets/icons/$iconurl.svg',
          height: 19,
        ));
  }
}
