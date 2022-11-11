import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TimeShower extends StatelessWidget {
  final String prefix;
  final String value;
  const TimeShower({super.key, required this.prefix, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    .bodySmall!
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
    );
  }
}
