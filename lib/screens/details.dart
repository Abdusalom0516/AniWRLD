import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/474x/d2/a8/bf/d2a8bf3fc1ba2d1bc27eab933fe0ec3d.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorsClass.milk,
                                  width: CustomMethods.width(context, 200))),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              colors: [
                                ColorsClass.dark.withOpacity(0.37),
                                ColorsClass.dark.withOpacity(0.5)
                              ])),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: CustomMethods.width(context, 27),
                          left: CustomMethods.width(context, 41)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title Part
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: CustomMethods.width(context, 31)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: CustomMethods.width(
                                                  context, 70)),
                                          child: Icon(
                                            Icons.circle,
                                            color: ColorsClass.lightBlue,
                                            size: CustomMethods.width(
                                                context, 35),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Naruto Shippudennnnnn",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsClass.milk
                                                    .withOpacity(0.9),
                                                fontFamily: "PatuaOne",
                                                fontSize: CustomMethods.width(
                                                    context, 15)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: CustomMethods.width(context, 20),
                                  ),
                                  // Year and Score Part
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            CustomMethods.width(context, 31)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Year Part
                                        Text(
                                          "Y: 2011",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsClass.milk
                                                  .withOpacity(0.8),
                                              fontFamily: "PatuaOne",
                                              fontSize: CustomMethods.width(
                                                  context, 17)),
                                        ),
                                        // Score Part
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: CustomMethods.width(
                                                  context, 110),
                                              horizontal: CustomMethods.width(
                                                  context, 20)),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: CustomMethods.width(
                                                  context, 200),
                                              color: ColorsClass.milk
                                                  .withOpacity(0.8),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                CustomMethods.width(
                                                    context, 40)),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.yellow),
                                              Text(
                                                " 8.7",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: ColorsClass.milk
                                                        .withOpacity(0.9),
                                                    fontFamily: "PatuaOne",
                                                    fontSize:
                                                        CustomMethods.width(
                                                            context, 19)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: CustomMethods.width(context, 40),
                            ),
                            // Anime Poster Part
                            Expanded(
                              child: Transform.translate(
                                offset:
                                    Offset(0, -CustomMethods.width(context, 6)),
                                child: Container(
                                  height: CustomMethods.width(context, 2.2),
                                  width: CustomMethods.width(context, 3.2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorsClass.milk,
                                          width: CustomMethods.width(
                                              context, 210)),
                                      borderRadius: BorderRadius.circular(
                                          CustomMethods.width(context, 27)),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://i.pinimg.com/474x/d5/1c/0a/d51c0ab7b0493a2a22b2b5a83a73001a.jpg"),
                                          fit: BoxFit.fill)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            CustomMethods.width(context, 27)),
                                        gradient: LinearGradient(colors: [
                                          ColorsClass.dark.withOpacity(0.2),
                                          ColorsClass.dark.withOpacity(0.2)
                                        ])),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                    // Bottom Part
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
