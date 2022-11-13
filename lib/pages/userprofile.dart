import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../models/user.dart';

import '../providers/user.dart';

import '../widgets/standartwidgets/standartpagestartwithimage.dart';
import '../widgets/standartwidgets/standartappbar.dart';

import '../widgets/userprofile/textfield.dart';
import '../widgets/userprofile/repeatpasswordfield.dart';
import '../widgets/userprofile/timeshower.dart';
import '../widgets/userprofile/togglebutton.dart';
import '../widgets/userprofile/birthplace.dart';

class UserProfileScreen extends StatefulWidget {
  static const routename = '/userprofilescreen';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController _contollerName;
  late TextEditingController _contollerUsername;
  late TextEditingController _contollerEmail;
  final _contollerPassword = TextEditingController();
  final _contollerRepeatPassword = TextEditingController();

  final _nameKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _repeatpasswordKey = GlobalKey<FormState>();

  late DateTime _birthDate;

  @override
  void initState() {
    super.initState();

    final providerUser =
        Provider.of<UserProvider>(context, listen: false).getuser;
    _contollerName = TextEditingController(text: providerUser.name);
    _contollerUsername = TextEditingController(text: providerUser.username);
    _contollerEmail = TextEditingController(text: providerUser.email);
    _birthDate = providerUser.birthdate;
  }

  @override
  void dispose() {
    super.dispose();
    _contollerEmail.dispose();
    _contollerName.dispose();
    _contollerUsername.dispose();
    _contollerRepeatPassword.dispose();
    _contollerPassword.dispose();
  }

  void _showdatepicker() async {
    DateTime? newdate = await showDatePicker(
        context: context,
        initialDate: _birthDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (newdate == null) return;

    setState(() {
      _birthDate = DateTime(
        newdate.year,
        newdate.month,
        newdate.day,
        _birthDate.hour,
        _birthDate.minute,
      );
    });
  }

  void _showtimepicker() async {
    TimeOfDay? newdate = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(_birthDate));
    if (newdate == null) return;

    setState(() {
      _birthDate = DateTime(
        _birthDate.year,
        _birthDate.month,
        _birthDate.day,
        newdate.hour,
        newdate.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PageStartWithImage(
        imageurl: 'assets/images/backgroundimage.png',
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
            OwnTextField(
                hinttext: 'Name',
                controller: _contollerName,
                formkey: _nameKey),
            const SizedBox(
              height: 10,
            ),
            OwnTextField(
              hinttext: 'Username',
              controller: _contollerUsername,
              formkey: _usernameKey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'LOGIN DATA',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            OwnTextField(
                hinttext: 'Email',
                controller: _contollerEmail,
                formkey: _emailKey),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: OwnTextField(
                        hinttext: 'New password',
                        controller: _contollerPassword,
                        formkey: _passwordKey)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: RepeatPasswordField(
                      hinttext: 'Confirm password',
                      controller: _contollerRepeatPassword,
                      controllerPassword: _contollerPassword,
                      formkey: _repeatpasswordKey),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'BIRTH CHART',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const BirthPlacePicker(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TimeShower(
                    prefix: 'Day',
                    value: _birthDate.day.toString(),
                    func: _showdatepicker),
                TimeShower(
                    prefix: 'Month',
                    value: _birthDate.month.toString(),
                    func: _showdatepicker),
                TimeShower(
                    prefix: 'Year',
                    value: _birthDate.year.toString(),
                    func: _showdatepicker)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TimeShower(
                    prefix: 'Hour',
                    value: _birthDate.hour > 12
                        ? (_birthDate.hour - 12).toString()
                        : _birthDate.hour.toString(),
                    func: _showtimepicker),
                TimeShower(
                    prefix: 'Minute',
                    value: _birthDate.minute.toString(),
                    func: _showtimepicker),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return UserToggleButton(
                        width: constraints.maxWidth,
                        birthdate: _birthDate,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'If you want to delete your account, please click the button.',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/deleteicon.svg',
                  height: 45,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (!_nameKey.currentState!.validate() ||
                          !_usernameKey.currentState!.validate() ||
                          !_emailKey.currentState!.validate() ||
                          !_passwordKey.currentState!.validate() ||
                          !_repeatpasswordKey.currentState!.validate()) {
                        return;
                      }
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUser(User(
                              name: _contollerName.text,
                              username: _contollerUsername.text,
                              email: _contollerEmail.text,
                              birthdate: _birthDate));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save')))
          ],
        ),
      ),
    );
  }
}
