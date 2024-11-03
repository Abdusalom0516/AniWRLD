import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/bests.dart';
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
    return Scaffold(
        backgroundColor: ColorsClass.dark,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            backgroundColor: ColorsClass.dark,
            iconSize: CustomMethods.width(context, 14),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorsClass.milk,
            unselectedItemColor: ColorsClass.milk,
            onTap: (value) {},
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  activeIcon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_sharp), label: "Seasons"),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: CustomMethods.width(context, 1.5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        CustomMethods.width(context, 50),
                        CustomMethods.width(context, 17),
                        CustomMethods.width(context, 50),
                        0),
                    child: Consumer<RecommendationImg>(
                      builder: (context, provider, child) => Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              CustomMethods.width(context, 23),
                              0,
                              CustomMethods.width(context, 23),
                              CustomMethods.width(context, 17),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorsClass.milk,
                                    width: CustomMethods.width(context, 600)),
                                borderRadius: BorderRadius.circular(
                                    CustomMethods.width(context, 20)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        provider.recomendationsImgPaths[
                                            provider.index]),
                                    fit: BoxFit.cover)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CustomMethods.width(context, 20)),
                                  gradient: LinearGradient(colors: [
                                    Colors.black.withOpacity(0.43),
                                    Colors.black.withOpacity(0.43)
                                  ])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: CustomMethods.width(context, 130)),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: provider.listOfLinesMaker(context),
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
                                    color: ColorsClass.milk.withOpacity(0.8),
                                  ),
                                  padding: EdgeInsets.all(
                                      CustomMethods.width(context, 30)),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: ColorsClass.dark,
                                    size: CustomMethods.width(context, 15),
                                  )),
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
                                    color: ColorsClass.milk.withOpacity(0.8),
                                  ),
                                  padding: EdgeInsets.all(
                                      CustomMethods.width(context, 30)),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: ColorsClass.dark,
                                    size: CustomMethods.width(context, 15),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

              // CustomWidgets.height(context, 40),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: CustomMethods.width(context, 17)),
              //   child: Text(
              //     "Don’t miss these top-rated series!",
              //     style: TextStyle(
              //         color: ColorsClass.milk.withOpacity(0.7),
              //         fontFamily: "PatuaOne",
              //         fontSize: CustomMethods.width(context, 25)),
              //   ),
              // ),
              CustomWidgets.height(context, 40),
              Padding(
                padding:
                    EdgeInsets.only(left: CustomMethods.width(context, 17)),
                child: Text(
                  "Top Rated",
                  style: TextStyle(
                      color: ColorsClass.milk.withOpacity(0.7),
                      fontFamily: "PatuaOne",
                      fontSize: CustomMethods.width(context, 16)),
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
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                CustomMethods.width(context, 20)),
                            gradient: LinearGradient(colors: [
                              Colors.black.withOpacity(0.37),
                              Colors.black.withOpacity(0.37)
                            ])),
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
                padding:
                    EdgeInsets.only(left: CustomMethods.width(context, 17)),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: ColorsClass.milk.withOpacity(0.7),
                      fontFamily: "PatuaOne",
                      fontSize: CustomMethods.width(context, 16)),
                ),
              ),
              CustomWidgets.height(context, 37),
              Expanded(
                  child: Consumer<Bests>(
                builder: (context, provider, child) => GridView.builder(
                  itemCount: provider.bestsImgPaths.length,
                  // physics: const CarouselScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2,
                    mainAxisSpacing: CustomMethods.width(context, 15),
                    crossAxisSpacing: CustomMethods.width(context, 20),
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: CustomMethods.width(context, 27)),
                  itemBuilder: (context, index) => Container(
                    // margin: EdgeInsets.only(
                    //   right: CustomMethods.width(context, 17),
                    // ),
                    width: CustomMethods.width(context, 2.7),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorsClass.milk,
                            width: CustomMethods.width(context, 600)),
                        borderRadius: BorderRadius.circular(
                            CustomMethods.width(context, 20)),
                        image: DecorationImage(
                            image: NetworkImage(provider.bestsImgPaths[index]),
                            fit: BoxFit.fill)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              CustomMethods.width(context, 20)),
                          gradient: LinearGradient(colors: [
                            Colors.black.withOpacity(0.37),
                            Colors.black.withOpacity(0.37)
                          ])),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
