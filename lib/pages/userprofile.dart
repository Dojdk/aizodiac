import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/user.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';
import '../widgets/standartwidgets/standartappbar.dart';

import '../widgets/userprofile/textfield.dart';
import '../widgets/userprofile/timeshower.dart';

class UserProfileScreen extends StatefulWidget {
  static const routename = '/userprofilescreen';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController _contollerName;
  late TextEditingController _contollerSurname;
  late TextEditingController _contollerEmail;
  final _contollerPassword = TextEditingController();
  final _contollerRepeatPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    final providerUser =
        Provider.of<UserProvider>(context, listen: false).getuser;
    _contollerName = TextEditingController(text: providerUser.name);
    _contollerSurname = TextEditingController(text: providerUser.surname);
    _contollerEmail = TextEditingController(text: providerUser.email);
  }

  @override
  void dispose() {
    super.dispose();
    _contollerEmail.dispose();
    _contollerName.dispose();
    _contollerSurname.dispose();
    _contollerRepeatPassword.dispose();
    _contollerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerUser =
        Provider.of<UserProvider>(context, listen: false).getuser;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PageStartWithImage(
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
                width: 30),
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
            OwnTextField(hinttext: 'Name', controller: _contollerName),
            const SizedBox(
              height: 10,
            ),
            OwnTextField(hinttext: 'Surname', controller: _contollerSurname),
            const SizedBox(
              height: 30,
            ),
            Text(
              'LOGIN DATA',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            OwnTextField(hinttext: 'Email', controller: _contollerEmail),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: OwnTextField(
                  hinttext: 'New password',
                  controller: _contollerPassword,
                )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: OwnTextField(
                    hinttext: 'Confirm password',
                    controller: _contollerRepeatPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'BIRTH CHART',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TimeShower(
                    prefix: 'Day',
                    value: providerUser.birthdate.day.toString()),
                TimeShower(
                    prefix: 'Month',
                    value: providerUser.birthdate.month.toString()),
                TimeShower(
                    prefix: 'Year',
                    value: providerUser.birthdate.year.toString())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TimeShower(
                    prefix: 'Hour',
                    value: providerUser.birthdate.hour.toString()),
                TimeShower(
                    prefix: 'Minute',
                    value: providerUser.birthdate.minute.toString()),
                Expanded(
                    child: ToggleButtons(isSelected: const [], children: []))
              ],
            ),
            Center(
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Save')))
          ],
        ),
      ),
    );
  }
}
