import 'package:flutter/material.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';
import '../widgets/standartwidgets/standartappbar.dart';

import '../widgets/userprofile/textfield.dart';

class UserProfileScreen extends StatelessWidget {
  static const routename = '/userprofilescreen';
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStartWithImage(
      imageurl: 'assets/images/backgroundimage.png',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          StandartAppBar(
              iconname: 'pagegobackicon',
              iconfunc: () => Navigator.of(context).pop(),
              alignment: MainAxisAlignment.start,
              height: 15,
              width: 35),
          const SizedBox(
            height: 20,
          ),
          Text(
            'PROFILE SETTINGS',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'ABOUT ME',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          const OwnTextField(hinttext: 'Name'),
          const SizedBox(
            height: 10,
          ),
          const OwnTextField(hinttext: 'Username'),
          const SizedBox(
            height: 30,
          ),
          Text(
            'LOGIN DATA',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const OwnTextField(hinttext: 'john777@gmail.com'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Expanded(child: OwnTextField(hinttext: 'New password')),
              SizedBox(
                width: 15,
              ),
              Expanded(child: OwnTextField(hinttext: 'Confirm password')),
            ],
          ),
        ],
      ),
    );
  }
}
