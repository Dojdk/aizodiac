import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../constants/drawermap.dart';

import '../widgets/standartwidgets/standartpagestart.dart';
import '../widgets/standartwidgets/standartappbar.dart';
import '../widgets/drawer/draweritem.dart';

class DrawerPage extends StatelessWidget {
  static const routename = '/drawerpage';
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStart(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            StandartAppBar(
              height: 25,
              width: 25,
              alignment: MainAxisAlignment.end,
              iconname: 'closeicon',
              iconfunc: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              'MENU',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drawermap.length,
                itemBuilder: (context, index) => OwnDrawerItem(
                    iconurl: drawermap.values.elementAt(index),
                    text: drawermap.keys.elementAt(index)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/icons/rocketicon.svg',
                          fit: BoxFit.fill,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Log Out'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
