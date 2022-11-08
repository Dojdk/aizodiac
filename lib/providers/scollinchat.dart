import 'package:flutter/foundation.dart';

class ScrollInChat extends ChangeNotifier {
 double value = 0;

  void changevalue(double newValue) {
    value = newValue;
    notifyListeners();
  }

  double get getvalue {
    return value;
  }
}
