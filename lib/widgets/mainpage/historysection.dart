import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../pages/chatwithaipage.dart';
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
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute('What is Leo Love Horoscope for x'));
                },
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
                message: 'Some random text written by AI',
                time: DateTime.now()),
            if (index == 2)
              ChatBubbleMe(message: 'Hello', time: DateTime.now()),
            ChatBubble(
                message: 'Some random text written by AI',
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

Route _createRoute(String text) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatWithAiPage(mytext: text),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
