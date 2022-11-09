import 'package:flutter/foundation.dart';

class ScrollInChat extends ChangeNotifier {
  double _value = 0;


  void changevalue(double newValue) {
    _value = newValue;
    notifyListeners();
  }

 

  void setToZero() {
    _value = 0;

    notifyListeners();
  }

  double get getvalue {
    return _value;
  }

}
