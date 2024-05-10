import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  TimeOfDay? time;
  DateTime? date;

  double sliderData=0;
  int  sindex=1;
  int  bi=0;

  PageController pageController=PageController();
  PageController pageController1=PageController();
  int sliderIndex=0;

  void setTime(TimeOfDay time) {
    this.time = time;
    notifyListeners();
  }

  void changePage(int index) {
    bi = index;
    notifyListeners();
  }
  void changeSliderIndex(int index) {
    sliderIndex = index;
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
