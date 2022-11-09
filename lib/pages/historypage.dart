import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/messages.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

import '../widgets/chatwithai/chatbubble_me.dart';
import '../widgets/chatwithai/chatbubble.dart';
import '../widgets/history/appbar.dart';

class HistoryPage extends StatefulWidget {
  static const routename = '/hisrotypage';

  const HistoryPage({
    super.key,
  });

  @override
  State<HistoryPage> createState() => _HisrotyPage();
}

class _HisrotyPage extends State<HistoryPage> {
  bool scrollStarted = false;

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
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification) {
                  if (!scrollStarted) {
                    if (notification.metrics.pixels + 100 < 0) {
                      Navigator.of(context).pop();

                      scrollStarted = true;
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: providerHistory.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const HistoryAppBar();
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
          ),
        ],
      ),
    );
  }
}
