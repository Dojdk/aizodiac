import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

class OwnDrawerItem extends StatelessWidget {
  final String iconurl;
  final String text;
  const OwnDrawerItem({super.key, required this.iconurl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                height: 22,
                width: 22,
                child: SvgPicture.asset(
                  'assets/icons/$iconurl.svg',
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        if (text != 'CONTACT US')
          Container(
            height: 1,
            width: double.infinity,
            color: maingrey,
          ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
