import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/index.dart';
import '../../providers/messages.dart';

import '../chatwithai/chatbubble.dart';
import '../chatwithai/chatbubble_me.dart';

List<String> text = ['HOROSCOPE', 'LOVE', 'QUESTION'];

class HistorySection extends StatelessWidget {
  final ScrollController scrollController;
  final VoidCallback scrollDown;
  final VoidCallback scrollUp;
  const HistorySection(
      {super.key,
      required this.scrollDown,
      required this.scrollUp,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final providerMessage =
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
                onPressed: scrollDown,
                icon: SvgPicture.asset(
                  'assets/icons/upicon.svg',
                  height: 25,
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.purple],
                stops: [0.8, 1.0],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: providerMessage.length + 1,
              itemBuilder: (context, index) {
                if (index == providerMessage.length) {
                  return Column(
                    children: [
                      Align(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: scrollUp,
                            child: const Text('Get more answers'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  );
                }
                if (providerMessage[index].isMe) {
                  return ChatBubbleMe(
                      message: providerMessage[index].text,
                      time: providerMessage[index].time);
                }
                return ChatBubble(
                    message: providerMessage[index].text,
                    time: providerMessage[index].time);
              },
            ),
          ),
        ),
      ],
    );
  }
}
