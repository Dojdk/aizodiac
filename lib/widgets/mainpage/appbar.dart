import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../pages/drawerpage.dart';

import '../../constants/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              'assets/icons/drawericon.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              color: maingrey,
            ),
            children: const [
              TextSpan(text: 'HELLO'),
              TextSpan(
                  text: ',  JOHN',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 40,
            width: 40,
            child: SvgPicture.asset(
              'assets/icons/leoicon.svg',
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const DrawerPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
        animation,
      ),
      child: const DrawerPage(),
    ),
  );
}
