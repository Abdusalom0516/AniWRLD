import 'dart:convert';

import 'package:anime_world/moduls/characters_data.dart';
import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CharactersProvider extends ChangeNotifier {
  List<CharactersData> listOfCharacters = [
    CharactersData("https://cdn.myanimelist.net/images/characters/7/483990.jpg?s=039439eae7342622d1a78c7c35d9c466", "Thorfinn"),
      CharactersData( "https://cdn.myanimelist.net/images/characters/14/401940.webp?s=738c36550f7afd3f402a32a5bbef66c8", "Askeladd"),
    CharactersData("https://cdn.myanimelist.net/images/characters/16/501347.jpg?s=d62399a94b28137806c57f4ca22c6676", "Einar"),
    CharactersData("https://cdn.myanimelist.net/images/characters/13/384487.jpg?s=4efbfd51e1907250553981dcf14f7b55", "Ari"),
    CharactersData("https://cdn.myanimelist.net/images/characters/13/490092.jpg?s=09eb77f214245d84a39f3ece10129734", "Arnheid"),
    CharactersData( "https://cdn.myanimelist.net/images/characters/2/398871.jpg?s=d55b28bdc6bf51f7ca2ff4e4390b2081", "Asgeir"),
  ];

  Future<void> getAllCharacters(int animeId) async {
    listOfCharacters.clear();
    notifyListeners();
    final response = await get(
        Uri.parse("https://api.jikan.moe/v4/anime/$animeId/characters"));

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body)["data"];
      for (var elem in list) {
        listOfCharacters.add(CharactersData(
            elem["character"]["images"]["jpg"]["image_url"],
            elem["character"]["name"]));
      }

      notifyListeners();
      LogService().d(listOfCharacters.toString());
    } else {
      LogService().e("Could not get characters...");
    }
  }
}
