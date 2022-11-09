import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/messages.dart';
import '../providers/scollinchat.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

import '../widgets/chatwithai/chatbubble_me.dart';
import '../widgets/chatwithai/chatbubble.dart';
import '../widgets/chatwithai/appbar.dart';

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
  bool scrollStarted = false;

  Future<void> reloadingScreen(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      Provider.of<Messages>(context, listen: false).addQuestion(
          text: widget.textToShow, isMe: true, time: DateTime.now());
      await Provider.of<Messages>(context, listen: false)
          .getAnswer(text: widget.mytext);
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
    final providerMessage =
        Provider.of<Messages>(context, listen: false).messageslist;
    final providerScroll = Provider.of<ScrollInChat>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<ScrollInChat>(context, listen: false).setToZero();
      
        return true;
      },
      child: PageStartWithImage(
        imageurl: 'assets/images/backgroundimage.png',
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: NotificationListener(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification) {
                          if (notification.metrics.pixels < 20) {
                            providerScroll.changeShpwAppBar(true);
                          } else {
                            providerScroll.changeShpwAppBar(false);
                          }
                        }
                        if (!scrollStarted &&
                            notification is ScrollUpdateNotification) {
                          providerScroll.changevalue(
                              notification.dragDetails!.delta.direction);
                          providerScroll.changeShpwAppBar(false);
                          scrollStarted = true;
                        }
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: providerMessage.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const ChatAIAppBar();
                          }
                          if (index == providerMessage.length + 1) {
                            return Column(
                              children: [
                                Align(
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Provider.of<ScrollInChat>(context, listen: false).setToZero();
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
                          if (providerMessage[index - 1].isMe) {
                            return ChatBubbleMe(
                                message: providerMessage[index - 1].text,
                                time: providerMessage[index - 1].time);
                          }
                          return ChatBubble(
                              message: providerMessage[index - 1].text,
                              time: providerMessage[index - 1].time);
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
