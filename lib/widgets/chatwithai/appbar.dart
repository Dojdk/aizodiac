import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../standartwidgets/standartappbar.dart';

import '../../providers/scollinchat.dart';

class ChatAIAppBar extends StatefulWidget {
  const ChatAIAppBar({super.key});

  @override
  State<ChatAIAppBar> createState() => _ChatAIAppBarState();
}

class _ChatAIAppBarState extends State<ChatAIAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScrollInChat>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        AnimatedOpacity(
          opacity: provider.getvalue >= 0 ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: StandartAppBar(
              iconname: 'closeicon',
              iconfunc: () {
                provider.getvalue >= 0 ? Navigator.of(context).pop() : null;
              },
              alignment: MainAxisAlignment.end,
              height: 25,
              width: 25),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Text(
              provider.getvalue >= 0
                  ? 'HERE IS YOUR ANSWER!'
                  : 'YOUR QUESTION HISTORY',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              width: 20,
            ),
            AnimatedOpacity(
              opacity: provider.getvalue < 0 ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: SvgPicture.asset(
                'assets/icons/downiconblue.svg',
                height: 20,
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
