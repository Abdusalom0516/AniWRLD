import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Popular extends ChangeNotifier {
  List<AnimeInfoShort> popularAnimes = [];

  Future<void> getPopularAnimes() async {
    Random random = Random();
    int randomNum =
        random.nextInt(int.parse(DateTime.now().year.toString()[3]) + 1);
    int randomMonth = random.nextInt(4);
    List<String> months = ["winter", "spring", "summer", "fall"];
    final response = await get(
        Uri.parse("https://api.jikan.moe/v4/seasons/202$randomNum/${months[randomMonth]}"));

    final data = [];
    if (response.statusCode == 200) {
      data.addAll(jsonDecode(response.body)["data"]);
      try {
        for (var elem in data) {
          popularAnimes.add(AnimeInfoShort(
              elem["mal_id"],
              elem["images"]["jpg"]["large_image_url"],
              elem["title_english"],
              elem["score"]));
        }
      } catch (e) {
        LogService().e(e.toString());
      }
      notifyListeners();
      // LogService().e(recomendationsData.length.toString());
      // LogService().d(data.toString());
    } else {
      LogService().e("Had a problem while getting Response from the Server");
    }

    Timer(
      const Duration(seconds: 2),
      () => notifyListeners(),
    );
  }
}
