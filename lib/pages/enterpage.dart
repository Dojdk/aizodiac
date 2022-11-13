import 'package:flutter/material.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
        imageurl: 'assets/images/enterbackgroundimage.png',
        child: Column(
          children: [
            Row(
              children: const [
                
              ],
            )
          ],
        ));
  }
}
