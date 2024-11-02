import 'package:anime_world/config/colors.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/services/custom_methods.dart';
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
          children: [
            Expanded(
                flex: 3,
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
                                  image: NetworkImage(provider
                                      .recomendationsImgPaths[provider.index]),
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    CustomMethods.width(context, 20)),
                                gradient: LinearGradient(colors: [
                                  Colors.black.withOpacity(0.53),
                                  Colors.black.withOpacity(0.53)
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
            Expanded(flex: 5, child: Container())
          ],
        ),
      ),
    );
  }
}
