import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ShareButton extends StatelessWidget {
  final bool tapped;
  final Function update;
  const ShareButton({super.key, required this.tapped, required this.update});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: () => update(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      tapped
                          ? 'assets/icons/shareicontap.svg'
                          : 'assets/icons/shareicon.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
  }
}