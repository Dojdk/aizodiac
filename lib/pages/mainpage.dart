import 'package:flutter/material.dart';

import '../widgets/mainpage/maincolumn.dart';
import '../widgets/mainpage/historysection.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final _controller = PageController(
    viewportFraction: 0.94,
  );
  late ScrollController _scrollController;
  late ScrollController _scrollControllertwo;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollControllertwo = ScrollController();
    _scrollController.addListener(swapPageListener);
    _scrollControllertwo.addListener(swapPageListenertwo);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _controller.dispose();
  }

  void swapPageListener() {
    if (_scrollController.offset >
        _scrollController.position.maxScrollExtent + 50) {
      if (_index == 0) {
        _controller.animateToPage(
            curve: Curves.ease, duration: const Duration(milliseconds: 600), 1);
      }
    }
  }

  void swapPageListenertwo() {
    if (_scrollControllertwo.offset <
        _scrollControllertwo.position.minScrollExtent - 50) {
      if (_index == 1) {
        _controller.animateToPage(
            curve: Curves.ease, duration: const Duration(milliseconds: 600), 0);
      }
    }
  }

  // final ItemScrollController itemScrollController = ItemScrollController();
  void _scrolltohistory() {
    _controller.animateToPage(
        curve: Curves.ease, duration: const Duration(milliseconds: 600), 1);
  }

  void _scrollup() {
    _controller.animateToPage(
        curve: Curves.ease, duration: const Duration(milliseconds: 600), 0);
  }

  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            onPageChanged: (value) {
              _index = value;
            },
            padEnds: false,
            controller: _controller,
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              MainColumn(
                scrollController: _scrollController,
              ),
              HistorySection(
                scrollController: _scrollControllertwo,
                scrollDown: _scrolltohistory,
                scrollUp: _scrollup,
              )
            ],
          )
        ],
      ),
    );
  }
}
