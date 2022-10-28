import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DateItem extends StatelessWidget {
  final bool center;
  final DateTime time;

  const DateItem({super.key, required this.time, required this.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat.E().format(time).toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: center ? FontWeight.bold : FontWeight.normal,
              color: center ? mainblue : maingrey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          time.day.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: center ? FontWeight.bold : FontWeight.normal,
              color: center ? mainblue : maingrey),
        ),
        if (time.day == DateTime.now().day)
          Text(
            '•',
            style: TextStyle(
                fontSize: 20,
                fontWeight: center ? FontWeight.bold : FontWeight.normal,
                color: center ? mainblue : maingrey),
          )
      ],
    );
  }
}
