import 'dart:convert';

import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class SearchResults extends ChangeNotifier {
  bool isLoading = false;
  Future<void> getSearchResultsByTitle(String title) async {
    isLoading = true;
    notifyListeners();
    final request =
        await get(Uri.parse("https://api.jikan.moe/v4/anime?q=<$title>"));

    if (request.statusCode == 200) {
      searchResultsList.clear();
      try {
        final body = jsonDecode(request.body)["data"];
        LogService().d(body.toString());

        for (var elem in body) {
          searchResultsList.add(AnimeInfoShort(
              elem["mal_id"],
              elem["images"]["jpg"]["image_url"],
              elem["title"],
              elem["score"]));
        }
        isLoading = false;
        notifyListeners();
      } catch (e) {
        LogService().e(e.toString());
      }
    } else {
      LogService()
          .e("There was a problem while requesting API search results.");
    }
  }

  List<AnimeInfoShort> searchResultsList = [];
}
