import 'package:flutter/material.dart';

import '../widgets/mainpage/maincolumn.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Stack(
        fit: StackFit.expand,
        children: const [
          MainColumn(),
          // RateUsColumn(),
        ],
      ),
    );
  }
}
