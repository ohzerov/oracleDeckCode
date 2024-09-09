import 'package:flutter/foundation.dart';

class ShowButtonCounter extends ChangeNotifier {
  bool _isShowButton = false;
  int counter = 0;

  bool get isShowButton => _isShowButton;
  void add() {
    if (counter < 3) {
      counter += 1;
      print(counter);
    }
    if (counter == 3) {
      _isShowButton = true;
      notifyListeners();
      // _isShowButton = false;
      // counter = 0;
    }
  }

  void resetValues() {
    _isShowButton = false;
    counter = 0;
    notifyListeners();
  }
}
