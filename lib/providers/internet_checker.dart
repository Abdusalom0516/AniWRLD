import 'dart:async';
import 'package:anime_world/providers/random.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker extends ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;
  late StreamSubscription subscription;

  void internetConnectionListener(BuildContext context,
      RecommendationImg recommendationImg, TopRated topRated, Popular popular) {
    subscription = InternetConnection().onStatusChange.listen(
      (event) async {
        switch (event) {
          case InternetStatus.connected:
            _isConnected = true;
            await _initializeData(recommendationImg, topRated, popular);
            notifyListeners();
            // ignore: use_build_context_synchronously
            break;
          case InternetStatus.disconnected:
            _isConnected = false;
            notifyListeners();
            break;

          default:
            break;
        }
      },
    );
  }

  Future<void> _initializeData(RecommendationImg recommendationImg,
      TopRated topRated, Popular popular) async {
    Future.wait([
      recommendationImg.getRecommendedAnimes(),
      topRated.getTopRatedAnimes(),
      popular.getPopularAnimes(),
    ]);

    while (recommendationImg.recomendationsData.isEmpty) {
      await recommendationImg.getRecommendedAnimes();
    }

    while (topRated.topRatedAnimes.isEmpty) {
      await topRated.getTopRatedAnimes();
    }

    while (popular.popularAnimes.isEmpty) {
      await popular.getPopularAnimes();
    }
  }
}
