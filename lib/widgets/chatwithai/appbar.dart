import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../providers/scrollinchat.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              provider.getvalue >= 0
                  ? 'HERE IS YOUR ANSWER!'
                  : 'YOUR QUESTION HISTORY',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<ScrollInChat>(context, listen: false).setToZero();
              },
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
