import 'dart:async';
import 'dart:convert';

import 'package:anime_world/moduls/anime_info_short.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchResults extends ChangeNotifier {
  bool isLoading = false;
  bool foundNothing = false;

  Future<void> getSearchResultsByTitle(String title) async {
    isLoading = true;
    notifyListeners();

    try {
      // Correct URI parsing
      final uri = Uri.parse("https://api.jikan.moe/v4/anime?q=$title&sfw=true");

      // Make the request with timeout
      final response = await http.get(uri).timeout(const Duration(seconds: 4));

      if (response.statusCode == 200) {
        searchResultsList.clear();
        try {
          final body = jsonDecode(response.body)["data"];
          LogService().d(body.toString());

          for (var elem in body) {
            searchResultsList.add(AnimeInfoShort(
              elem["mal_id"],
              elem["images"]["jpg"]["image_url"],
              elem["title"],
              elem["score"],
            ));
          }
          isLoading = false;
          foundNothing = searchResultsList.isEmpty;
          notifyListeners();
        } catch (e) {
          LogService().e(e.toString());
        }
      } else {
        LogService().e(
            "There was a problem while requesting API search results. Status code: ${response.statusCode}");
      }
    } on TimeoutException catch (_) {
      LogService().e("The request timed out. Please try again later.");
    } catch (e) {
      LogService().e("An error occurred: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<AnimeInfoShort> searchResultsList = [];
}
