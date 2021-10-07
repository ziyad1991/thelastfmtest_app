import 'package:flutter/material.dart';

class serachdata with ChangeNotifier {
  String searchvalue = 'Air';

  void changeString(String newvalue) {
    searchvalue = newvalue;
    notifyListeners();
  }
}
