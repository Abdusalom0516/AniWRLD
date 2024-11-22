import 'dart:convert';

import 'package:anime_world/moduls/search_info.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class SearchResults extends ChangeNotifier {
  Future<void> getSearchResultsByTitle(String title) async {
    final request =
        await get(Uri.parse("https://api.jikan.moe/v4/anime?q=<$title>"));

    if (request.statusCode == 200) {
      searchResultsList.clear();
      try {
        final body = jsonDecode(request.body)["data"];
        LogService().d(body.toString());

        for (var elem in body) {
          searchResultsList.add(SearchInfo(
              elem["mal_id"],
              elem["images"]["jpg"]["image_url"],
              elem["title"],
              elem["score"]));
        }
        LogService().e(searchResultsList.first.title?? "Unknown");
        notifyListeners();
      } catch (e) {
        LogService().e(e.toString());
      }
    } else {
      LogService()
          .e("There was a problem while requesting API search results.");
    }
  }

  List<SearchInfo> searchResultsList = [];
}
