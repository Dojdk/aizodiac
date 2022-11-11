import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/index.dart';
import '../../providers/user.dart';

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
  final ScrollController scrollController;
  const MainColumn({super.key, required this.scrollController});

  @override
  State<MainColumn> createState() => _MainColumnState();
}

Future _showDialog(BuildContext ctx, String text) => showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        title: Text(text, style: Theme.of(context).textTheme.bodyMedium),
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
  bool showback = true;
  bool showbacksecond = true;

  String time = DateFormat.yMMMMd().format(DateTime.now());

  void _updatetime(DateTime datetime) {
    showbacksecond = datetime.day >= DateTime.now().day &&
        datetime.day <= DateTime.now().day + 2;
    time = DateFormat.yMMMMd().format(datetime).toString();

    if (showbacksecond != showback) {
      if (showbacksecond == false) {
        _showDialog(
            context, 'Sorry,can\'t provide a horoscope for this time period.');
      }
      setState(() {
        showback = showbacksecond;
      });
    }
  }

  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerIndex = Provider.of<Index>(context);
    final providerUser =
        Provider.of<UserProvider>(context, listen: false).getuser;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        physics: const ClampingScrollPhysics(),
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
            MainToggleButton(func: _updatetime),
            const SizedBox(
              height: 20,
            ),
            if (providerIndex.indexnumber == 2)
              OwnTextField(controller: textcontroller),
            if (providerIndex.indexnumber == 2)
              const SizedBox(
                height: 20,
              ),
            if (providerIndex.indexnumber != 2)
              DateList(updatetime: _updatetime),
            Text(
              'mode *casual horoscope*\nCLASS_PERSONILIZED1\n{',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomSwitch(
                text: switchmap.keys.elementAt(providerIndex.indexnumber),
                color: switchmap.values.elementAt(providerIndex.indexnumber),
                switchback: showback || providerIndex.indexnumber == 2,
                value: true,
                onTap: () {
                  if (providerIndex.indexnumber == 0) {
                    Navigator.of(context).push(_createRoute(
                        text: 'What is Leo Horoscope for $time',
                        textToShow:
                            'What is ${providerUser.name} Horoscope for $time'));
                  }
                  if (providerIndex.indexnumber == 1) {
                    Navigator.of(context).push(_createRoute(
                        text: 'What is Leo Love Horoscope for $time',
                        textToShow:
                            'What is ${providerUser.name} Love Horoscope for $time'));
                  }
                  if (providerIndex.indexnumber == 2) {
                    if (textcontroller.text.isEmpty) {
                      _showDialog(context, 'Please provide valid question.');
                      return;
                    }
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(_createRoute(
                        text: '${textcontroller.text} My zodiac sign is Leo!',
                        textToShow: textcontroller.text));
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
                'name_ ${providerUser.name} ${providerUser.surname}\nbirth date_ ${DateFormat.yMd().format(providerUser.birthdate)}\nbirth time_ ${DateFormat.jm().format(providerUser.birthdate)}\nbirth location_ USA',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 20,
            ),
            const HistorySection(),
          ],
        ),
      ),
    );
  }
}

Route _createRoute({required String text, required String textToShow}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatWithAiPage(mytext: text, textToShow: textToShow),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
