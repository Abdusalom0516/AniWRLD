import 'dart:convert';

import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Popular extends ChangeNotifier {
  List<AnimeInfoShort> popularAnimes = [];

  Future<void> getPopularAnimes() async {
    final response =
        await get(Uri.parse("https://api.jikan.moe/v4/anime"));

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
  }
}
