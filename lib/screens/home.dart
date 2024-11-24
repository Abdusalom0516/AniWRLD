import 'dart:async';

import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/bests.dart';
import 'package:anime_world/providers/navigation_index.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<RecommendationImg>(context).startSliding();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationIndex>(
      builder: (context, providerOuter, child) => Scaffold(
          backgroundColor: ColorsClass.dark,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: providerOuter.index,
              backgroundColor: ColorsClass.dark,
              iconSize: CustomMethods.width(context, 14),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: ColorsClass.lightBlue,
              unselectedItemColor: ColorsClass.milk,
              onTap: (value) {
                providerOuter.changeIndex(context, value);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_sharp), label: "Details"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: "Settings",
                    activeIcon: Icon(Icons.settings)),
              ]),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorsClass.milk,
                        width: CustomMethods.width(context, 550)))),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    floating: false,
                    backgroundColor: ColorsClass.dark,
                    expandedHeight: CustomMethods.width(context, 1.6),
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        height: CustomMethods.width(context, 1.6),
                        child: Container(
                          color: ColorsClass.dark,
                          padding: EdgeInsets.fromLTRB(
                            CustomMethods.width(context, 50),
                            0,
                            CustomMethods.width(context, 50),
                            0,
                          ),
                          child: Consumer<RecommendationImg>(
                            builder: (context, provider, child) => Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                    CustomMethods.width(context, 23),
                                    CustomMethods.width(context, 50),
                                    CustomMethods.width(context, 23),
                                    CustomMethods.width(context, 17),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsClass.milk,
                                      width: CustomMethods.width(context, 600),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      CustomMethods.width(context, 20),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        provider
                                                .recomendationsData[
                                                    provider.index]
                                                .img ??
                                            "https://wallpapers.com/images/hd/dark-background-b59iy2towqy5yrgb.jpg",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            CustomMethods.width(context, 20),
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(0.43),
                                              Colors.black.withOpacity(0.43),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: CustomMethods.width(
                                                  context, 40),
                                              right: CustomMethods.width(
                                                  context, 31)),
                                          width: double.infinity,
                                          height:
                                              CustomMethods.width(context, 8.3),
                                          decoration: BoxDecoration(
                                              color: ColorsClass.dark
                                                  .withOpacity(0.7),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    CustomMethods.width(
                                                        context, 20),
                                                  ),
                                                  bottomRight: Radius.circular(
                                                      CustomMethods.width(
                                                          context, 20)))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  provider
                                                          .recomendationsData[
                                                              provider.index]
                                                          .title ??
                                                      "Unknown",
                                                  style: TextStyle(
                                                      color: ColorsClass.milk
                                                          .withOpacity(0.7),
                                                      fontFamily: "PatuaOne",
                                                      fontSize:
                                                          CustomMethods.width(
                                                              context, 17)),
                                                ),
                                              ),
                                              CustomWidgets.width(context, 15),
                                              Text(
                                                "⭐ ${provider.recomendationsData[provider.index].score}",
                                                style: TextStyle(
                                                    color: ColorsClass.milk
                                                        .withOpacity(0.8),
                                                    fontFamily: "PatuaOne",
                                                    fontSize:
                                                        CustomMethods.width(
                                                            context, 19)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      provider.increment();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            ColorsClass.milk.withOpacity(0.8),
                                      ),
                                      padding: EdgeInsets.all(
                                        CustomMethods.width(context, 30),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: ColorsClass.dark,
                                        size: CustomMethods.width(context, 15),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      provider.decrement();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            ColorsClass.milk.withOpacity(0.8),
                                      ),
                                      padding: EdgeInsets.all(
                                        CustomMethods.width(context, 30),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: ColorsClass.dark,
                                        size: CustomMethods.width(context, 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList.list(children: [
                    CustomWidgets.height(context, 40),
                    Padding(
                      padding: EdgeInsets.only(
                          left: CustomMethods.width(context, 17)),
                      child: Row(
                        children: [
                          Container(
                            width: CustomMethods.width(context, 57),
                            height: CustomMethods.width(context, 15),
                            decoration: BoxDecoration(
                                color: ColorsClass.lightBlue,
                                borderRadius: BorderRadius.circular(
                                    CustomMethods.width(context, 15))),
                          ),
                          CustomWidgets.width(context, 67),
                          Text(
                            "Top Rated",
                            style: TextStyle(
                                color: ColorsClass.milk.withOpacity(0.7),
                                fontFamily: "PatuaOne",
                                fontSize: CustomMethods.width(context, 16)),
                          ),
                        ],
                      ),
                    ),
                    CustomWidgets.height(context, 37),
                    Consumer<TopRated>(
                      builder: (context, provider, child) => SizedBox(
                        height: CustomMethods.width(context, 1.9),
                        child: ListView.builder(
                          itemCount: provider.topRatedAnimesImgPath.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: index == 0
                                ? EdgeInsets.only(
                                    left: CustomMethods.width(context, 17),
                                    right: CustomMethods.width(context, 17),
                                  )
                                : EdgeInsets.only(
                                    right: CustomMethods.width(context, 17),
                                  ),
                            width: CustomMethods.width(context, 2.7),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorsClass.milk,
                                    width: CustomMethods.width(context, 600)),
                                borderRadius: BorderRadius.circular(
                                    CustomMethods.width(context, 20)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        provider.topRatedAnimesImgPath[index]),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          CustomMethods.width(context, 20)),
                                      gradient: LinearGradient(colors: [
                                        Colors.black.withOpacity(0.37),
                                        Colors.black.withOpacity(0.37)
                                      ])),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        CustomMethods.width(context, 40)),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: CustomMethods.width(context, 10.7),
                                    decoration: BoxDecoration(
                                        color:
                                            ColorsClass.dark.withOpacity(0.83),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                CustomMethods.width(
                                                    context, 20)),
                                            bottomRight: Radius.circular(
                                                CustomMethods.width(
                                                    context, 20)))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Anime name",
                                          style: TextStyle(
                                              color: ColorsClass.milk
                                                  .withOpacity(0.7),
                                              fontFamily: "PatuaOne",
                                              fontSize: CustomMethods.width(
                                                  context, 31)),
                                        ),
                                        Text(
                                          "⭐ 7.3",
                                          style: TextStyle(
                                              color: ColorsClass.milk
                                                  .withOpacity(0.7),
                                              fontFamily: "PatuaOne",
                                              fontSize: CustomMethods.width(
                                                  context, 30)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomWidgets.height(context, 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: CustomMethods.width(context, 17)),
                      child: Text(
                        "Think you’ve seen it all? Think again. This section features popular animes that are rewriting the rules of the genre.",
                        style: TextStyle(
                            color: ColorsClass.milk.withOpacity(0.7),
                            fontFamily: "PatuaOne",
                            fontSize: CustomMethods.width(context, 25)),
                      ),
                    ),
                    CustomWidgets.height(context, 40),
                    Padding(
                      padding: EdgeInsets.only(
                          left: CustomMethods.width(context, 17)),
                      child: Row(
                        children: [
                          Container(
                            width: CustomMethods.width(context, 57),
                            height: CustomMethods.width(context, 15),
                            decoration: BoxDecoration(
                                color: ColorsClass.lightBlue,
                                borderRadius: BorderRadius.circular(
                                    CustomMethods.width(context, 15))),
                          ),
                          CustomWidgets.width(context, 67),
                          Text(
                            "Popular",
                            style: TextStyle(
                                color: ColorsClass.milk.withOpacity(0.7),
                                fontFamily: "PatuaOne",
                                fontSize: CustomMethods.width(context, 16)),
                          ),
                        ],
                      ),
                    ),
                    CustomWidgets.height(context, 37),
                  ]),
                  Consumer<Bests>(
                    builder: (context, provider, child) => SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomMethods.width(context, 27),
                      ),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: CustomMethods.width(context, 15),
                          crossAxisSpacing: CustomMethods.width(context, 25),
                          childAspectRatio: 1 / 1.37,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              width: CustomMethods.width(context, 2.7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorsClass.milk,
                                  width: CustomMethods.width(context, 600),
                                ),
                                borderRadius: BorderRadius.circular(
                                  CustomMethods.width(context, 20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      provider.bestsImgPaths[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            CustomMethods.width(context, 20)),
                                        gradient: LinearGradient(colors: [
                                          Colors.black.withOpacity(0.37),
                                          Colors.black.withOpacity(0.37)
                                        ])),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          CustomMethods.width(context, 40)),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: CustomMethods.width(context, 8.7),
                                      decoration: BoxDecoration(
                                          color:
                                              ColorsClass.dark.withOpacity(0.8),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  CustomMethods.width(
                                                      context, 20)),
                                              bottomRight: Radius.circular(
                                                  CustomMethods.width(
                                                      context, 20)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Vinland Saga",
                                            style: TextStyle(
                                                color: ColorsClass.milk
                                                    .withOpacity(0.7),
                                                fontFamily: "PatuaOne",
                                                fontSize: CustomMethods.width(
                                                    context, 27)),
                                          ),
                                          Text(
                                            "⭐ 7.3",
                                            style: TextStyle(
                                                color: ColorsClass.milk
                                                    .withOpacity(0.7),
                                                fontFamily: "PatuaOne",
                                                fontSize: CustomMethods.width(
                                                    context, 27)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: provider.bestsImgPaths.length,
                        ),
                      ),
                    ),
                  ),
                  SliverList.list(children: [
                    CustomWidgets.height(context, 17),
                  ])
                ],
              ),
            ),
          )),
    );
  }
}

// Scroll Sqweezing Effect Remover
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
