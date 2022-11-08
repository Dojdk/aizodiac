import 'package:flutter/foundation.dart';

class ScrollInChat extends ChangeNotifier {
  double _value = 0;
  bool _showAppBar = true;

  void changevalue(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  void changeShpwAppBar(bool value) {
    _showAppBar =value;
    notifyListeners();
  }

  void setToZero() {
    _value = 0;
    notifyListeners();
  }

  double get getvalue {
    return _value;
  }
   bool get getshowappb {
    return _showAppBar;
  }
}
