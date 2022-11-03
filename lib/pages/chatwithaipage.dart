import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/aianswer.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';
import '../widgets/standartwidgets/standartappbar.dart';

import '../widgets/chatwithai/chatbubble.dart';
import '../widgets/chatwithai/chatbubble_me.dart';

class ChatWithAiPage extends StatefulWidget {
  static const routename = '/chatwithaipage';
  final String mytext;
  const ChatWithAiPage({super.key, required this.mytext});

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
      await Provider.of<AiAnswer>(context, listen: false).getData(text: '${widget.mytext} My zodiac sign is Leo!');
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
                    iconfunc: () => Navigator.of(context).pop(),
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
                  child: ListView(children: [
                    ChatBubbleMe(message: widget.mytext, time: DateTime.now()),
                    ChatBubble(
                        message: Provider.of<AiAnswer>(context, listen: false)
                            .aianswer,
                        time: DateTime.now()),
                    Align(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Get more answers'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
    );
  }
}