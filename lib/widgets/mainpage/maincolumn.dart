import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'appbar.dart';
import 'togglebutton.dart';
import 'datelist.dart';
import 'switchbutton.dart';
import 'textfield.dart';
import 'historysection.dart';

import '../../constants/colors.dart';
import '../../constants/switchmap.dart';

import '../../pages/chatwithaipage.dart';

class MainColumn extends StatefulWidget {
  const MainColumn({super.key});

  @override
  State<MainColumn> createState() => _MainColumnState();
}

Future _showDialog(BuildContext ctx) => showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        title: Text('Please provide valid question',
            style: Theme.of(context).textTheme.bodyMedium),
        actions: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK')),
          )
        ],
      ),
    );

class _MainColumnState extends State<MainColumn> {
  int index = 0;
  bool showback = true;
  void _update(indextoggle) {
    index = indextoggle;
    setState(() {});
  }

  String time = DateFormat.yMMMMd().format(DateTime.now());
  void _updatetime(DateTime datetime) {
    showback = datetime.day > DateTime.now().day - 2;
    time = DateFormat.yMMMMd().format(datetime).toString();
  }

  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const MainAppBar(),
          const SizedBox(
            height: 20,
          ),
          MainToggleButton(update: _update),
          const SizedBox(
            height: 20,
          ),
          if (index == 2) OwnTextField(controller: textcontroller),
          if (index == 2)
            const SizedBox(
              height: 20,
            ),
          if (index != 2) DateList(updatetime: _updatetime),
          Text(
            'mode *casual horoscope*\nCLASS_PERSONILIZED1\n{',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: CustomSwitch(
              text: switchmap.keys.elementAt(index),
              color: switchmap.values.elementAt(index),
              switchback: showback,
              value: true,
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).pushNamed(ChatWithAiPage.routename,
                      arguments: 'What is Leo Horoscope for $time');
                }
                if (index == 1) {
                  Navigator.of(context).pushNamed(ChatWithAiPage.routename,
                      arguments: 'What is Leo love Horoscope for $time');
                }
                if (index == 2) {
                  if (textcontroller.text.isEmpty) {
                    _showDialog(context);
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pushNamed(ChatWithAiPage.routename,
                      arguments:
                          '${textcontroller.text} My zodiac sign is Leo');
                  textcontroller.clear();
                }
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: maingrey,
              ),
              children: [
                TextSpan(
                    text: 'INSTRUCTIONS',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w700)),
                TextSpan(
                    text:
                        ' “swipe down to request your personilized horoscope data collected and analysed by artificial intelligence info entered',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
              'name_ John Burbon\nbirth date_ 08/20/1994\nbirth time_ 9:00 pm\nbirth location_ USA',
              style: Theme.of(context).textTheme.bodySmall),
          HistorySection(index: index),
        ],
      ),
    );
  }
}
