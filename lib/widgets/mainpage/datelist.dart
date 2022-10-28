import 'package:flutter/material.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../mainpage/dateitem.dart';

class DateList extends StatefulWidget {
  const DateList({super.key});

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        _itemcontroller.scrollTo(
            index: centerindex - 3,
            duration: const Duration(milliseconds: 600)));
  }

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

  final _itemcontroller = ItemScrollController();

  late int centerindex = days.length ~/ 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 90,
        child: ScrollablePositionedList.builder(
          itemScrollController: _itemcontroller,
          addAutomaticKeepAlives: true,
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                centerindex = index;
              });
              _itemcontroller.scrollTo(
                  index: (index - 3) < 0 ? 0 : index - 3,
                  duration: const Duration(milliseconds: 600));
            },
            child: Container(
              padding: index == centerindex ? null : const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 8),
              child: DateItem(
                center: centerindex == index,
                time: days[index],
              ),
            ),
          ),
        ));
  }
}
