import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../standartwidgets/standartappbar.dart';

import '../../constants/colors.dart';

class RateUsColumn extends StatelessWidget {
  const RateUsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 7,
        sigmaY: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          StandartAppBar(
              iconname: 'closeicon',
              iconfunc: () {},
              alignment: MainAxisAlignment.end,
              height: 25,
              width: 25),
          const SizedBox(
            height: 40,
          ),
          Text(
            'YOUR OPINION MATTER TO US !',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'We work super hard to serve you better and would love to know how would you rate our app?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(child: Image.asset('assets/images/rateusimage.png')),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: RatingBar.builder(
              itemSize: 45,
              itemPadding: const EdgeInsets.all(8),
              initialRating: 3,
              allowHalfRating: true,
              unratedColor: transparentwhite.withOpacity(1),
              glow: false,
              itemBuilder: (context, index) => SvgPicture.asset(
                'assets/icons/staricon.svg',
                color: mainblue,
              ),
              onRatingUpdate: (value) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Sorry, not now',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
