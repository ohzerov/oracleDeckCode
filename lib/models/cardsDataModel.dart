import 'package:flutter/foundation.dart';

class CardsDataModel extends ChangeNotifier {
  List<int> dataList = [0, 0, 0];
  void add(int index, int position) {
    dataList[position] = index;
    notifyListeners();
  }

  void resetValues() {
    dataList = [0, 0, 0];
    notifyListeners();
  }
}
