import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _myUser = User(
    name: 'John',
    username: 'Burbon',
    email: 'john777@gmail.com',
    birthdate: DateTime(1994, 8, 20, 21),
  );
  //  DateTime(time.year, time.month, time.day, newHour, time.minute, time.second, time.millisecond, time.microsecond);
  User get getuser {
    return _myUser;
  }

  void updateUser(User newWalues) {
    _myUser = newWalues;
    notifyListeners();
  }
}
