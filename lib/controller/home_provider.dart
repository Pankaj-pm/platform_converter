import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  TimeOfDay? time;
  DateTime? date;

  void setTime(TimeOfDay time) {
    this.time = time;
    notifyListeners();
  }

  void setDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }
}
