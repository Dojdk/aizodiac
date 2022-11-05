import 'package:flutter/material.dart';

import '../widgets/mainpage/maincolumn.dart';
import '../widgets/mainpage/historysection.dart';

import '../widgets/chatwithai/chatbubble.dart';
import '../widgets/chatwithai/chatbubble_me.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

import '../providers/messages.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  void _scrolltohistory() {
    itemScrollController.scrollTo(
      alignment: .08,
      index: 2,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _scrollup() {
    itemScrollController.scrollTo(
      index: 0,
      duration: const Duration(milliseconds: 300),
    );
  }

  late List<Widget> widgets = [
    const MainColumn(),
    HistorySection(
      func: _scrolltohistory,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final providerMessage =
        Provider.of<Messages>(context, listen: false).messageshistorylist;
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Stack(
        fit: StackFit.expand,
        children: [
          ScrollablePositionedList.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemScrollController: itemScrollController,
            itemCount: providerMessage.length + 3,
            itemBuilder: (context, index) {
              if (index <= 1) {
                return widgets[index];
              }
              if (index == providerMessage.length + 2) {
                return Column(
                  children: [
                    Align(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _scrollup,
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
              if (providerMessage[index - 2].isMe) {
                return ChatBubbleMe(
                    message: providerMessage[index - 2].text,
                    time: providerMessage[index - 2].time);
              }
              return ChatBubble(
                  message: providerMessage[index - 2].text,
                  time: providerMessage[index - 2].time);
            },
          ),
        ],
      ),
    );
  }
}
