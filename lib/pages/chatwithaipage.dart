import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/messages.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';
import '../widgets/standartwidgets/standartappbar.dart';

import '../widgets/chatwithai/chatbubble_me.dart';
import '../widgets/chatwithai/chatbubble.dart';

class ChatWithAiPage extends StatefulWidget {
  static const routename = '/chatwithaipage';
  final String mytext;
  final String textToShow;
  const ChatWithAiPage(
      {super.key, required this.mytext, required this.textToShow});

  @override
  State<ChatWithAiPage> createState() => _ChatWithAiPageState();
}

class _ChatWithAiPageState extends State<ChatWithAiPage> {
  bool _firsinit = true;
  bool _isLoading = false;
  Future<void> reloadingScreen(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (widget.mytext != 'Historykey6024973815123456789') {
        Provider.of<Messages>(context, listen: false).addMessage(
            text: widget.textToShow, isMe: true, time: DateTime.now());
        await Provider.of<Messages>(context, listen: false)
            .getAnswer(text: widget.mytext);
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          title: Text('Something went wrong',
              style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')),
            )
          ],
        ),
      );
      return;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    if (_firsinit) {
      reloadingScreen(context);
    }
    _firsinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final providerMessage = widget.mytext == 'Historykey6024973815123456789'
        ? Provider.of<Messages>(context, listen: false).messageshistorylist
        : Provider.of<Messages>(context, listen: false).messages;
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                StandartAppBar(
                    iconname: 'closeicon',
                    iconfunc: () {
                      Provider.of<Messages>(context, listen: false)
                          .clearMessages();
                      Navigator.of(context).pop();
                    },
                    alignment: MainAxisAlignment.end,
                    height: 25,
                    width: 25),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'HERE IS YOUR ANSWER !',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
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
                      itemCount: providerMessage.length + 1,
                      itemBuilder: (context, index) {
                        if (index == providerMessage.length) {
                          return Column(
                            children: [
                              Align(
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Provider.of<Messages>(context,
                                              listen: false)
                                          .clearMessages();
                                      Navigator.of(context).pop();
                                    },
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
            ),
    );
  }
}
