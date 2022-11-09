import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/messages.dart';
import '../providers/scollinchat.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

import '../widgets/chatwithai/chatbubble_me.dart';
import '../widgets/chatwithai/chatbubble.dart';
import '../widgets/chatwithai/appbar.dart';

class HisrotyPage extends StatefulWidget {
  static const routename = '/hisrotypage';

  const HisrotyPage({
    super.key,
  });

  @override
  State<HisrotyPage> createState() => _HisrotyPage();
}

class _HisrotyPage extends State<HisrotyPage> {
  @override
  Widget build(BuildContext context) {
    final providerHistory =
        Provider.of<Messages>(context, listen: false).messageshistorylist;
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.purple],
                  stops: [0.7, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: ListView.builder(
                itemCount: providerHistory.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const ChatAIAppBar();
                  }
                  if (index == providerHistory.length + 1) {
                    return Column(
                      children: [
                        Align(
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Get more answers'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        )
                      ],
                    );
                  }
                  if (providerHistory[index - 1].isMe) {
                    return ChatBubbleMe(
                        message: providerHistory[index - 1].text,
                        time: providerHistory[index - 1].time);
                  }
                  return ChatBubble(
                      message: providerHistory[index - 1].text,
                      time: providerHistory[index - 1].time);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
