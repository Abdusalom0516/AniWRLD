import 'dart:async';
import 'dart:convert';

import 'package:anime_world/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DetailsData extends ChangeNotifier {
  List<String> listOfDetailsImg = [
    "https://i.pinimg.com/736x/c9/7b/cb/c97bcb1c7070e3a5ed0b45d862e094c3.jpg",
    "https://i.pinimg.com/736x/25/b7/96/25b796129bdf395070d51c6f84179d3d.jpg",
    "https://i.pinimg.com/736x/2b/a9/97/2ba9974e31997b9058f9cda8d4cc4ab4.jpg",
    "https://i.pinimg.com/736x/9a/30/1f/9a301fa6a41ba85606cdda378b4c4d92.jpg",
    "https://i.pinimg.com/474x/d2/a8/bf/d2a8bf3fc1ba2d1bc27eab933fe0ec3d.jpg",
    "https://i.pinimg.com/736x/8d/30/86/8d30863273af5ddd8ce50bdd42310b63.jpg"
  ];

  Map<String, dynamic> animeDetails = {
    "title": null,
    "score": null,
    "year": null,
    "trailer": null,
    "description": null,
    "thumbnail": null,
    "image": null,
    "genres": null
  };

  Future<void> getDetailedInfo(int id, BuildContext context) async {
    final response =
        await get(Uri.parse("https://api.jikan.moe/v4/anime/$id/full"));

    // ignore: prefer_typing_uninitialized_variables
    late final data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body)["data"];
      try {
        animeDetails["title"] = data["title_english"] ?? "unknown";
        animeDetails["score"] = data["score"] ?? "--";
        animeDetails["year"] = data["year"] ?? "----";
        animeDetails["trailer"] = data["trailer"]["url"];
        animeDetails["description"] = data["synopsis"] ?? "unknown";
        animeDetails["thumbnail"] = data["images"]["jpg"]["large_image_url"] ?? "https://i.pinimg.com/736x/2c/3c/bc/2c3cbc0bb22b93579ebdd3fd69d00229.jpg";
        animeDetails["image"] = data["trailer"]["images"]["medium_image_url"] ?? "https://i.pinimg.com/736x/9a/30/1f/9a301fa6a41ba85606cdda378b4c4d92.jpg";
        animeDetails["genres"] = _takeGenres(data["genres"]);
        // ignore: use_build_context_synchronously
        
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

List<String> _takeGenres(var list) {
  List<String> genres = [];

  for (var elem in list) {
    genres.add(elem["name"] ?? "Action");
  }

  return genres;
}
