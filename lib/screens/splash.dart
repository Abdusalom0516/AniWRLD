import 'dart:async';

import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/internet_checker.dart';
import 'package:anime_world/providers/random.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Future<void> _initializeData(BuildContext context) async {
  //   await Future.wait([
  //      Provider.of<RecommendationImg>(context, listen: false)
  //       .getRecommendedAnimes(),
  //    Provider.of<TopRated>(context, listen: false).getTopRatedAnimes(),
  //    Provider.of<Popular>(context, listen: false).getPopularAnimes()
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    
     // Access your providers
    final recommendationImg = Provider.of<RecommendationImg>(context, listen: false);
    final topRated = Provider.of<TopRated>(context, listen: false);
    final popular = Provider.of<Popular>(context, listen: false);

    // Start listening for the internet connection
    context.read<InternetChecker>().internetConnectionListener(
    context, recommendationImg, topRated, popular);

    Timer(const Duration(milliseconds: 2300), () => context.go("/"));

    return Scaffold(
        backgroundColor: ColorsClass.dark,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/images/aniWrld.png"),
                height: CustomMethods.width(context, 1.35),
              ),
              CustomWidgets.height(context, 9)
            ],
          ),
        ));
  }
}
