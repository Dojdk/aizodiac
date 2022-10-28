import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../chatwithai/chatbubble.dart';
import '../chatwithai/chatbubble_me.dart';

List<String> text = ['HOROSCOPE', 'LOVE', 'QUESTION'];

class HistorySection extends StatelessWidget {
  final int index;
  const HistorySection({super.key, required this.index});

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
              'YOUR ${text[index]} HISTORY',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/upicon.svg',
                  height: 25,
                )),
          ],
        ),
        Column(
          children: [
            if (index == 2)
              ChatBubbleMe(message: 'Hello', time: DateTime.now()),
            ChatBubble(
                message: 'Some random text written buy AI',
                time: DateTime.now()),
            if (index == 2)
              ChatBubbleMe(message: 'Hello', time: DateTime.now()),
            ChatBubble(
                message: 'Some random text written buy AI',
                time: DateTime.now()),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
