import 'package:flutter/foundation.dart';

class CardsDataModel extends ChangeNotifier {
  List<int> dataList = [];
  void add(int index) {
    dataList.add(index);
    notifyListeners();
  }
}
