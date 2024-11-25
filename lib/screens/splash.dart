import 'dart:async';

import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/popular.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

   Future<void> _initializeData(BuildContext context) async {
    await Provider.of<RecommendationImg>(context, listen: false).getRecommendedAnimes();
    // ignore: use_build_context_synchronously
    await Provider.of<TopRated>(context, listen: false).getTopRatedAnimes();
    // ignore: use_build_context_synchronously
    await Provider.of<Popular>(context, listen: false).getPopularAnimes();
  }

  @override
  Widget build(BuildContext context) {
   _initializeData(context).then((_) {
      Timer(const Duration(milliseconds: 2100), () => context.go("/"));
    });
    return Scaffold(
        backgroundColor: ColorsClass.dark,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/images/berserk.png"),
                height: CustomMethods.width(context, 1.5),
              ),
              CustomWidgets.height(context, 9)
            ],
          ),
        ));
  }
}
