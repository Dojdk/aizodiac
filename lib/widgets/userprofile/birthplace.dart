import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

class BirthPlacePicker extends StatelessWidget {
  const BirthPlacePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'California, United States',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Birth Place',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: mainblue),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: SvgPicture.asset(
                'assets/icons/placeicon.svg',
                height: 25,
              ),
            )
          ],
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white,
        )
      ],
    );
  }
}
