import 'package:flutter/material.dart';

import '../mainpage/dateitem.dart';

class DateList extends StatefulWidget {
  final Function updatetime;
  const DateList({super.key, required this.updatetime});

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  final List<DateTime> days = [
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now().subtract(const Duration(days: 6)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 4)),
    DateTime.now().subtract(const Duration(days: 3)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: 4)),
    DateTime.now().add(const Duration(days: 5)),
    DateTime.now().add(const Duration(days: 6)),
    DateTime.now().add(const Duration(days: 7)),
  ];

  final _controller = PageController(viewportFraction: 1 / 7, initialPage: 7);

  late int centerindex = (days.length ~/ 2) + 3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: PageView.builder(
        controller: _controller,
        padEnds: false,
        onPageChanged: (value) {
          setState(() {
            widget.updatetime(days[value]);
            centerindex = value + 3;
          });
        },
        scrollDirection: Axis.horizontal,
        itemCount: days.length + 6,
        itemBuilder: (context, index) {
          if (index == 0 ||
              index == 1 ||
              index == 2 ||
              index == 18 ||
              index == 19 ||
              index == 20) return const SizedBox();
          return GestureDetector(
            onTap: () {
              _controller.animateToPage(index - 3,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            },
            child: Container(
              padding: index == centerindex
                  ? null
                  : const EdgeInsets.only(
                      top: 10,
                    ),
              child: DateItem(
                center: centerindex == index,
                time: days[index - 3],
              ),
            ),
          );
        },
      ),
    );
  }
}
