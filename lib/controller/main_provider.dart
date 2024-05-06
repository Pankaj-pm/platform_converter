import 'dart:io';

import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {

  bool isAndroid=Platform.isAndroid;
  void changePlatform(bool isAndroid) {
    this.isAndroid = isAndroid;
    notifyListeners();
  }

}
