import 'package:flutter/material.dart';

class AiAvatar extends StatelessWidget {
  const AiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/chatbackground.png',
          ),
        ),
      ),
      child: Center(
        child: Text(
          'AI',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
