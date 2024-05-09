import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  TimeOfDay? time;
  DateTime? date;

  double sliderData=0;
  int  sindex=1;

  void setTime(TimeOfDay time) {
    this.time = time;
    notifyListeners();
  }

  void setDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  void changeSlider(double val) {
    sliderData = val;
    notifyListeners();
  }
}
