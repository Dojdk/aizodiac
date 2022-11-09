import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/index.dart';
import '../../providers/messages.dart';

import '../chatwithai/chatbubble.dart';
import '../chatwithai/chatbubble_me.dart';

import '../../pages/historypage.dart';

List<String> text = ['HOROSCOPE', 'LOVE', 'QUESTION'];

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerHistory =
        Provider.of<Messages>(context, listen: false).messageshistorylist;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOUR ${text[Provider.of<Index>(context).indexnumber]} HISTORY',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                icon: SvgPicture.asset(
                  'assets/icons/upicon.svg',
                  height: 25,
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.purple],
              stops: [0.5, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: Column(
            children: [
              ChatBubbleMe(
                  message: providerHistory[0].text,
                  time: providerHistory[0].time),
              ChatBubble(
                  message: providerHistory[1].text,
                  time: providerHistory[1].time),
            ],
          ),
        ),
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const HisrotyPage(),
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
