import 'dart:async';

import 'package:flutter/material.dart';

class DetailsData extends ChangeNotifier {
  List<String> listOfDetailsImg = [
    "https://i.pinimg.com/736x/c9/7b/cb/c97bcb1c7070e3a5ed0b45d862e094c3.jpg",
    "https://i.pinimg.com/736x/25/b7/96/25b796129bdf395070d51c6f84179d3d.jpg",
    "https://i.pinimg.com/736x/2b/a9/97/2ba9974e31997b9058f9cda8d4cc4ab4.jpg",
    "https://i.pinimg.com/736x/9a/30/1f/9a301fa6a41ba85606cdda378b4c4d92.jpg",
    "https://i.pinimg.com/474x/d2/a8/bf/d2a8bf3fc1ba2d1bc27eab933fe0ec3d.jpg",
    "https://i.pinimg.com/736x/8d/30/86/8d30863273af5ddd8ce50bdd42310b63.jpg"
  ];

   int index = 0;

  void increment() {
    index++;
    if (index >= listOfDetailsImg.length) {
      index = 0;
    }
    notifyListeners();
  }

  void decrement() {
    index--;
    if (index < 0) {
      index = listOfDetailsImg.length - 1;
    }
    notifyListeners();
  }

  Timer? timer;
  void startSliding() {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(milliseconds: 4500),
      (timer) => increment(),
    );
  }

}
