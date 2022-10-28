import 'package:flutter/material.dart';

class PageStartWithImage extends StatelessWidget {
  final Widget child;
  final String imageurl;
  const PageStartWithImage(
      {super.key, required this.child, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageurl),
        )),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: child),
        ),
      ),
    );
  }
}
