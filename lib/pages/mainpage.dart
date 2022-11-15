import 'package:flutter/material.dart';

import '../widgets/mainpage/maincolumn.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

class MainPage extends StatefulWidget {
  static const routename='/mainpage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(swapPageListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void swapPageListener() {
    // if (_scrollController.offset >
    //     _scrollController.position.maxScrollExtent + 50) {

    // }
  }

  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Stack(
        fit: StackFit.expand,
        children: [
          MainColumn(
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
