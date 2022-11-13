import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TimeShower extends StatelessWidget {
  final String prefix;
  final String value;
  final Function func;
  const TimeShower(
      {super.key,
      required this.prefix,
      required this.value,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (() {
          func();
        }),
        child: Padding(
          padding: EdgeInsets.only(right: prefix == 'Year' ? 0 : 16.0),
          child: Column(
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  prefix,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: mainblue),
                ),
              ),
              Container(
                color: Colors.white,
                height: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
