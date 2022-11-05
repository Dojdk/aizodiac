import 'package:flutter/foundation.dart';

class Index with ChangeNotifier{
  int index=0;

  void changeindex(int indexnew){
    index=indexnew;
    notifyListeners();
  }

  

  int get indexnumber{
    return index;
  }
}