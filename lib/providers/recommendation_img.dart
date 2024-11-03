import 'dart:async';

import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:flutter/material.dart';

class RecommendationImg extends ChangeNotifier {
  int index = 0;

  void increment() {
    index++;
    if (index >= recomendationsImgPaths.length) {
      index = 0;
    }
    notifyListeners();
  }

  void decrement() {
    index--;
    if (index < 0) {
      index = recomendationsImgPaths.length - 1;
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

  List<String> recomendationsImgPaths = [
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/2ca884143642733.628f61235cce0.png',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/e66549143642733.628f6124ee6df.png',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/0d9727143642733.628f612428c82.png',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/c1c8bd143642733.628f61229c4c4.png',
    'https://ramenparados.com/wp-content/uploads/2019/07/your-name-1000x600.jpg',
  ];

  List<Widget> listOfLinesMaker(BuildContext context) {
    List<Widget> listOfLines = [];
    for (int i = 0; i < recomendationsImgPaths.length; i++) {
      if (i == index) {
        listOfLines.add(Container(
          decoration: BoxDecoration(
              color: ColorsClass.lightBlue,
              borderRadius: BorderRadius.circular(30)),
          width: CustomMethods.width(context, 10),
          height: CustomMethods.width(context, 70),
        ));
        if (i != recomendationsImgPaths.length) {
          listOfLines.add(SizedBox(
            width: CustomMethods.width(context, 77),
          ));
        }
      } else {
        listOfLines.add(Container(
          decoration: BoxDecoration(
              color: ColorsClass.milk.withOpacity(0.57),
              borderRadius: BorderRadius.circular(30)),
          width: CustomMethods.width(context, 30),
          height: CustomMethods.width(context, 70),
        ));
        if (i != recomendationsImgPaths.length) {
          listOfLines.add(SizedBox(
            width: CustomMethods.width(context, 77),
          ));
        }
      }
    }
    return listOfLines;
  }
}
