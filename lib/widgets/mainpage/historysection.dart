import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/index.dart';

List<String> text = ['HOROSCOPE', 'LOVE', 'QUESTION'];

class HistorySection extends StatelessWidget {
  final VoidCallback func;
  const HistorySection({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOUR ${text[Provider.of<Index>(context).indexnumber]} HISTORY',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
                onPressed: func,
                icon: SvgPicture.asset(
                  'assets/icons/upicon.svg',
                  height: 25,
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
