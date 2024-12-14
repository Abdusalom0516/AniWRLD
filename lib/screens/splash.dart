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

  @override
  Widget build(BuildContext context) {
    
    final recommendationImg =
        Provider.of<RecommendationImg>(context, listen: false);
    final topRated = Provider.of<TopRated>(context, listen: false);
    final popular = Provider.of<Popular>(context, listen: false);
    
    Tween tween = Tween(begin: 0.0, end: 1.1);

    
    context.read<InternetChecker>().internetConnectionListener(
        context, recommendationImg, topRated, popular);

    Timer(const Duration(milliseconds: 2500), () => context.go("/"));

    return Scaffold(
        backgroundColor: ColorsClass.dark,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TweenAnimationBuilder(
              //   builder: (context, value, child) => Container(
              //     margin: EdgeInsets.only(bottom: value as double),
              //     child: child,
              //   ),
              //   tween: tween,
              //   duration: const Duration(milliseconds: 1900),
              //   curve: Curves.easeIn,
              //   child: Image(
              //     image: const AssetImage("assets/images/aniWrld.png"),
              //     height: CustomMethods.width(context, 1.35),
              //   ),
              // ),
              TweenAnimationBuilder(
                builder: (context, value, child) => Transform.scale(
                  scale: value as double,
                  child: child,
                ),
                tween: tween,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInToLinear,
                child: Image(
                  image: const AssetImage("assets/images/aniWrld.png"),
                  height: CustomMethods.width(context, 1.35),
                ),
              ),
              CustomWidgets.height(context, 9)
            ],
          ),
        ));
  }
}
