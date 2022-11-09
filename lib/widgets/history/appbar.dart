import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HistoryAppBar extends StatefulWidget {
  const HistoryAppBar({super.key});

  @override
  State<HistoryAppBar> createState() => _HistoryAppBarState();
}

class _HistoryAppBarState extends State<HistoryAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'YOUR QUESTION HISTORY',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                'assets/icons/downiconblue.svg',
                height: 25,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
