import 'package:flutter/material.dart';

class PageStart extends StatelessWidget {
  final Widget child;
  const PageStart({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), child: child),
      ),
    );
  }
}
