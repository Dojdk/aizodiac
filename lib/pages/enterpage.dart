import 'package:flutter/material.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

import '../widgets/enter/enterswitch.dart';

import 'mainpage.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
      imageurl: 'assets/images/enterbackgroundimage.png',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: EnterSwitch(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(MainPage.routename);
              },
            ),
          )
        ],
      ),
    );
  }
}
