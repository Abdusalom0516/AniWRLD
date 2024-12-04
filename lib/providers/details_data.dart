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
    "title": "Vinland Saga Season 2",
    "score": 8.81,
    "year": 2023,
    "trailer": "https://www.youtube.com/watch?v=jBetoIlnDIM",
    "description": "After his father's death and the destruction of his village at the hands of English raiders, Einar wishes for a peaceful life with his family on their newly rebuilt farms. However, fate has other plans: his village is invaded once again. Einar watches helplessly as the marauding Danes burn his lands and slaughter his family. The invaders capture Einar and take him back to Denmark as a slave. \n\nEinar clings to his mother's final words to survive. He is purchased by Ketil, a kind slave owner and landlord who promises that Einar can regain his freedom in return for working in the fields. Soon, Einar encounters his new partner in farm cultivation—Thorfinn, a dejected and melancholic slave. As Einar and Thorfinn work together toward their freedom, they are haunted by both sins of the past and the ploys of the present. Yet they carry on, grasping for a glimmer of hope, redemption, and peace in a world that is nothing but unjust and unforgiving.\n\n[Written by MAL Rewrite]",
    "thumbnail": "https://cdn.myanimelist.net/images/anime/1170/124312l.jpg",
    "image": "https://img.youtube.com/vi/jBetoIlnDIM/mqdefault.jpg",
    "genres": ["Action", "Adventure", "Drama"]
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
        animeDetails["trailer"] = data["trailer"]["url"] ?? "https://youtu.be/f8JrZ7Q_p-8?si=_gRDjMYr2WzHw4PJ";
        animeDetails["description"] = data["synopsis"] ?? "unknown";
        animeDetails["thumbnail"] = data["images"]["jpg"]["large_image_url"] ?? "https://i.pinimg.com/736x/2c/3c/bc/2c3cbc0bb22b93579ebdd3fd69d00229.jpg";
        animeDetails["image"] = data["trailer"]["images"]["medium_image_url"] ?? "https://i.pinimg.com/736x/a2/cc/98/a2cc981a10723285a724a47d45443388.jpg";
        animeDetails["genres"] = _takeGenres(data["genres"]);
        
      } catch (e) {
        LogService().e(e.toString());
      }
      notifyListeners();
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
