import 'dart:async';
import 'dart:convert';

import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TopRated extends ChangeNotifier {
  List<AnimeInfoShort> topRatedAnimes = [];

  Future<void> getTopRatedAnimes() async {
    topRatedAnimes.clear();
    final response = await get(Uri.parse("https://api.jikan.moe/v4/top/anime"));

    final data = [];
    if (response.statusCode == 200) {
      data.addAll(jsonDecode(response.body)["data"]);
      try {
        for (var elem in data) {
          topRatedAnimes.add(AnimeInfoShort(
              elem["mal_id"],
              elem["images"]["jpg"]["large_image_url"],
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
      notifyListeners();
    }

    Timer(
      const Duration(milliseconds: 2300),
      () => notifyListeners(),
    );
  }
}
