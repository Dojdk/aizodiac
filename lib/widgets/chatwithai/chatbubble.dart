import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'aiavatar.dart';
import 'sharebutton.dart';
import 'shareitem.dart';

import '../../constants/shareicons.dart';

class ChatBubble extends StatefulWidget {
  final String message;
  final DateTime time;
  const ChatBubble({
    Key? key,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool tapped = false;
  void _update() {
    setState(() {
      tapped = !tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AiAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMd().format(widget.time),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      constraints:
                          const BoxConstraints(minWidth: 60, maxWidth: 200),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        widget.message,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ShareButton(tapped: tapped, update: _update)
          ],
        ),
        if (tapped)
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.only(left: 15),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: shareicons
                    .map((e) => ShareItem(func: () {}, iconurl: e))
                    .toList()),
          ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
