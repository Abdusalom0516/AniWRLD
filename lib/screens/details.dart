import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/alert_dialog.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/details_data.dart';
import 'package:anime_world/providers/navigation_index.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
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
  InheritedWidget? inheritedWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<InheritedWidget>();
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    if (inheritedWidget != null) {
      BackButtonInterceptor.remove(myInterceptor);
    }
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Provider.of<NavigationIndex>(context, listen: false)
        .changeIndex(context, 0);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<DetailsData>(context).startSliding();
    return Consumer2<NavigationIndex, DetailsData>(
      builder: (context, providerOuter, provider, child) => Scaffold(
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
                if (value == 3) {
                  MyAlertDialog.showExitConfirmation(context);
                } else {
                  providerOuter.changeIndex(context, value);
                }
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
                    icon: Icon(Icons.logout_rounded), label: "Leave"),
              ]),
          body: provider.animeDetails["title"] == null
              ? Center(
                  child: CircularProgressIndicator(
                  color: ColorsClass.milk,
                  strokeAlign: CustomMethods.width(context, 111),
                ))
              : Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: ColorsClass.milk,
                              width: CustomMethods.width(context, 550)))),
                  child: Column(
                    children: [
                      // Top Part
                      Expanded(
                        flex: 4,
                        // Thumbnail of the Anime Part
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      provider.animeDetails["image"]),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: ColorsClass.milk,
                                            width: CustomMethods.width(
                                                context, 200))),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        colors: [
                                          ColorsClass.dark.withOpacity(0.6),
                                          ColorsClass.dark.withOpacity(0.5)
                                        ])),
                              ),
                              //Poster Part
                              Container(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(
                                  right: CustomMethods.width(context, 27),
                                ),
                                child: Transform.translate(
                                  offset: Offset(
                                      0, CustomMethods.width(context, 3.9)),
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
                                        image: DecorationImage(
                                            image: NetworkImage(provider
                                                .animeDetails["thumbnail"]),
                                            fit: BoxFit.fill)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              CustomMethods.width(context, 27)),
                                          gradient: LinearGradient(colors: [
                                            ColorsClass.dark.withOpacity(0.3),
                                            ColorsClass.dark.withOpacity(0.25)
                                          ])),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Bottom Part
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: CustomMethods.width(context, 27),
                            left: CustomMethods.width(context, 50),
                          ),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Title Part
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: CustomMethods.width(
                                                    context, 31)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right:
                                                          CustomMethods.width(
                                                              context, 70)),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: ColorsClass.yellow,
                                                    size: CustomMethods.width(
                                                        context, 35),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    provider.animeDetails[
                                                            "title"] ??
                                                        "unknown",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: ColorsClass.milk
                                                            .withOpacity(0.9),
                                                        fontFamily: "PatuaOne",
                                                        fontSize:
                                                            CustomMethods.width(
                                                                context, 17)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: CustomMethods.width(
                                                context, 30),
                                          ),
                                          // Year and Score Part
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: CustomMethods.width(
                                                    context, 31)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Score Part
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          CustomMethods.width(
                                                              context, 110),
                                                      horizontal:
                                                          CustomMethods.width(
                                                              context, 20)),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width:
                                                          CustomMethods.width(
                                                              context, 200),
                                                      color: ColorsClass.milk
                                                          .withOpacity(0.8),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            CustomMethods.width(
                                                                context, 40)),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star,
                                                          color: ColorsClass
                                                              .yellow),
                                                      Text(
                                                        " ${provider.animeDetails["score"] ?? "--"}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: ColorsClass
                                                                .milk
                                                                .withOpacity(
                                                                    0.9),
                                                            fontFamily:
                                                                "PatuaOne",
                                                            fontSize:
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        21)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Year Part
                                                Text(
                                                  "Y: ${provider.animeDetails["year"] ?? "----"}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: ColorsClass.milk
                                                          .withOpacity(0.8),
                                                      fontFamily: "PatuaOne",
                                                      fontSize:
                                                          CustomMethods.width(
                                                              context, 21)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: CustomMethods.width(context, 23),
                                    ),
                                    // Anime Poster Part
                                    Expanded(child: Container())
                                  ]),

                              // Bottom Part
                              CustomWidgets.height(
                                  context, CustomMethods.width(context, 25)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Trailer Part
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              CustomMethods.width(context, 70),
                                          horizontal:
                                              CustomMethods.width(context, 13)),
                                      decoration: BoxDecoration(
                                        color: ColorsClass.darkRed,
                                        border: Border.all(
                                          width:
                                              CustomMethods.width(context, 200),
                                          color:
                                              ColorsClass.milk.withOpacity(0.8),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Trailer",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsClass.milk
                                                  .withOpacity(0.9),
                                              fontFamily: "PatuaOne",
                                              fontSize: CustomMethods.width(
                                                  context, 19)),
                                        ),
                                      )),
                                ],
                              ),
                              CustomWidgets.height(
                                  context, CustomMethods.width(context, 25)),
                              // Genres Part
                              SizedBox(
                                height: CustomMethods.width(context, 8.3),
                                child: ScrollConfiguration(
                                  behavior: NoGlowScrollBehavior(),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        provider.animeDetails["genres"].length,
                                    itemBuilder: (context, index) => Container(
                                      width: CustomMethods.width(context, 3.5),
                                      margin: index !=
                                              provider.animeDetails["genres"]
                                                      .length -
                                                  1
                                          ? EdgeInsets.only(
                                              right: CustomMethods.width(
                                                  context, 20))
                                          : const EdgeInsets.all(0),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              CustomMethods.width(context, 25)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width:
                                              CustomMethods.width(context, 200),
                                          color:
                                              ColorsClass.milk.withOpacity(0.8),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            CustomMethods.width(context, 40)),
                                      ),
                                      child: Text(
                                        provider.animeDetails["genres"][index],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsClass.milk
                                                .withOpacity(0.9),
                                            fontFamily: "PatuaOne",
                                            fontSize: CustomMethods.width(
                                                context, 25)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomWidgets.height(
                                  context, CustomMethods.width(context, 15)),
                              // Description Part
                              Expanded(
                                child: Text(
                                  provider.animeDetails["description"],
                                  maxLines: 9,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ColorsClass.milk.withOpacity(0.8),
                                      fontFamily: "PatuaOne",
                                      fontSize:
                                          CustomMethods.width(context, 23)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
