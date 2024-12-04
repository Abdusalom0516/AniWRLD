import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RecommendationImg extends ChangeNotifier {
  int index = 0;

  void increment() {
    index++;
    if (index >= recomendationsData.length) {
      index = 0;
    }
    notifyListeners();
  }

  void decrement() {
    index--;
    if (index < 0) {
      index = recomendationsData.length - 1;
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

  List<AnimeInfoShort> recomendationsData = [];

  List<Widget> listOfLinesMaker(BuildContext context) {
    List<Widget> listOfLines = [];
    for (int i = 0; i < recomendationsData.length; i++) {
      if (i == index) {
        listOfLines.add(Container(
          decoration: BoxDecoration(
              color: ColorsClass.lightBlue,
              borderRadius: BorderRadius.circular(30)),
          width: CustomMethods.width(context, 10),
          height: CustomMethods.width(context, 70),
        ));
        if (i != recomendationsData.length) {
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
        if (i != recomendationsData.length) {
          listOfLines.add(SizedBox(
            width: CustomMethods.width(context, 77),
          ));
        }
      }
    }
    return listOfLines;
  }

  Future<void> getRecommendedAnimes() async {
    recomendationsData.clear();
    Random random = Random();
    int randomNum =
        random.nextInt(int.parse(DateTime.now().year.toString()[3]) + 1);
    int randomMonth = random.nextInt(4);
    List<String> months = ["winter", "spring", "summer", "fall"];

    final response = await get(Uri.parse(
        "https://api.jikan.moe/v4/seasons/202$randomNum/${months[randomMonth]}"));

    final data = [];
    if (response.statusCode == 200) {
      data.addAll(jsonDecode(response.body)["data"]);
      try {
        for (var elem in data) {
          recomendationsData.add(AnimeInfoShort(
              elem["mal_id"],
              elem["trailer"]["images"]["maximum_image_url"],
              elem["title_english"],
              elem["score"]));
          notifyListeners();
        }
      } catch (e) {
        LogService().e(e.toString());
      }
      notifyListeners();
    } else {
      LogService().e("Had a problem while getting Response from the Server");
    }

    Timer(
      const Duration(seconds: 2),
      () => notifyListeners(),
    );
  }

  // Future<bool> isImageValid(String url) async {
  //   try {
  //     final response = await head(Uri.parse(url));
  //     return response.statusCode == 200;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
