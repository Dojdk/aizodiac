import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ChatBubbleMe extends StatelessWidget {
  final String message;
  final DateTime time;
  const ChatBubbleMe({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              DateFormat.yMd().format(time),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(minWidth: 60, maxWidth: 200),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(top: 25),
          child: SvgPicture.asset(
            'assets/icons/leoicon.svg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
