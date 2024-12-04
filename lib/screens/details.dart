import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/alert_dialog.dart';
import 'package:anime_world/providers/characters.dart';
import 'package:anime_world/providers/details_data.dart';
import 'package:anime_world/providers/internet_checker.dart';
import 'package:anime_world/providers/navigation_index.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/screens/no_connection.dart';
import 'package:anime_world/services/url_launcher.dart';
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
    return Consumer3<NavigationIndex, DetailsData, InternetChecker>(
      builder: (context, providerOuter, provider, connectionProviderCheck,
              child) =>
          !connectionProviderCheck.isConnected
              ? const NoConnection()
              : Scaffold(
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
                                      width:
                                          CustomMethods.width(context, 550)))),
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: CustomScrollView(
                              slivers: [
                                // Top Part
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.height(context, 3.3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              provider.animeDetails["image"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: ColorsClass.milk,
                                                  width: CustomMethods.width(
                                                      context, 200),
                                                ),
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                colors: [
                                                  ColorsClass.dark
                                                      .withOpacity(0.6),
                                                  ColorsClass.dark
                                                      .withOpacity(0.5),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Poster Part
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            margin: EdgeInsets.only(
                                              right: CustomMethods.width(
                                                  context, 27),
                                            ),
                                            child: Transform.translate(
                                              offset: Offset(
                                                0,
                                                CustomMethods.width(
                                                    context, 3.9),
                                              ),
                                              child: Container(
                                                height: CustomMethods.width(
                                                    context, 2.2),
                                                width: CustomMethods.width(
                                                    context, 3.2),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: ColorsClass.milk,
                                                    width: CustomMethods.width(
                                                        context, 210),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    CustomMethods.width(
                                                        context, 27),
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      provider.animeDetails[
                                                          "thumbnail"],
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      CustomMethods.width(
                                                          context, 27),
                                                    ),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        ColorsClass.dark
                                                            .withOpacity(0.3),
                                                        ColorsClass.dark
                                                            .withOpacity(0.25),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                          context, 31),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: CustomMethods
                                                                .width(context,
                                                                    70),
                                                          ),
                                                          child: Icon(
                                                            Icons.circle,
                                                            color: ColorsClass
                                                                .yellow,
                                                            size: CustomMethods
                                                                .width(context,
                                                                    35),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            provider
                                                                .animeDetails[
                                                                    "title"]
                                                                .toString()
                                                                .replaceAll(
                                                                    "/", " "),
                                                            overflow:
                                                                TextOverflow
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
                                                                          17),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          CustomMethods.width(
                                                              context, 30)),
                                                  // Year and Score Part
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right:
                                                          CustomMethods.width(
                                                              context, 31),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // Score Part
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        110),
                                                            horizontal:
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        20),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              width: CustomMethods
                                                                  .width(
                                                                      context,
                                                                      200),
                                                              color: ColorsClass
                                                                  .milk
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              CustomMethods
                                                                  .width(
                                                                      context,
                                                                      40),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.star,
                                                                  color: ColorsClass
                                                                      .yellow),
                                                              Text(
                                                                " ${provider.animeDetails["score"] ?? "--"}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsClass
                                                                      .milk
                                                                      .withOpacity(
                                                                          0.9),
                                                                  fontFamily:
                                                                      "PatuaOne",
                                                                  fontSize: CustomMethods
                                                                      .width(
                                                                          context,
                                                                          21),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // Year Part
                                                        Text(
                                                          "Y: ${provider.animeDetails["year"] ?? "----"}",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            color: ColorsClass
                                                                .milk
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily:
                                                                "PatuaOne",
                                                            fontSize:
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        21),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width: CustomMethods.width(
                                                    context, 23)),
                                            // Anime Poster Part
                                            Expanded(
                                                child:
                                                    Container()), // Placeholder for future content
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.width(context, 17),
                                  ),
                                ),

                                // Row with Trailer Part
                                SliverPadding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: CustomMethods.width(context,
                                          39)), // Adjust the padding values as needed
                                  sliver: SliverToBoxAdapter(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Trailer Button
                                        Container(
                                          alignment: Alignment.center,
                                          height:
                                              CustomMethods.height(context, 17),
                                          width:
                                              CustomMethods.width(context, 2.5),
                                          decoration: BoxDecoration(
                                            color: ColorsClass.darkRed,
                                            border: Border.all(
                                              width: CustomMethods.width(
                                                  context, 200),
                                              color: ColorsClass.milk
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              UrlLauncher.urlLaunch(provider
                                                  .animeDetails["trailer"]);
                                            },
                                            child: Text(
                                              "Trailer",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: ColorsClass.milk
                                                    .withOpacity(0.9),
                                                fontFamily: "PatuaOne",
                                                fontSize: CustomMethods.height(
                                                    context, 41),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Space after the Row
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.width(context, 15),
                                  ),
                                ),

                                SliverPadding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: CustomMethods.width(context,
                                          39)), // Adjust the padding values as needed
                                  sliver: SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: CustomMethods.width(context, 8.3),
                                      child: ScrollConfiguration(
                                        behavior: NoGlowScrollBehavior(),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: provider
                                              .animeDetails["genres"].length,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            width: CustomMethods.width(
                                                context, 3.5),
                                            margin: index !=
                                                    provider
                                                            .animeDetails[
                                                                "genres"]
                                                            .length -
                                                        1
                                                ? EdgeInsets.only(
                                                    right: CustomMethods.width(
                                                        context, 20),
                                                  )
                                                : const EdgeInsets.all(0),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: CustomMethods.width(
                                                  context, 25),
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: CustomMethods.width(
                                                    context, 200),
                                                color: ColorsClass.milk
                                                    .withOpacity(0.8),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                CustomMethods.width(
                                                    context, 40),
                                              ),
                                            ),
                                            child: Text(
                                              provider.animeDetails["genres"]
                                                  [index],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: ColorsClass.milk
                                                    .withOpacity(0.9),
                                                fontFamily: "PatuaOne",
                                                fontSize: CustomMethods.width(
                                                    context, 25),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Space after the Genres Part
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.width(context, 25),
                                  ),
                                ),
                                // Description Part
                                SliverPadding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          CustomMethods.width(context, 39)),
                                  sliver: SliverToBoxAdapter(
                                    child: Text(
                                      provider.animeDetails["description"] ??
                                          "",
                                      style: TextStyle(
                                        color:
                                            ColorsClass.milk.withOpacity(0.8),
                                        fontFamily: "PatuaOne",
                                        fontSize:
                                            CustomMethods.width(context, 23),
                                      ),
                                    ),
                                  ),
                                ),

                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.width(context, 25),
                                  ),
                                ),

                                // Characters List Part
                                SliverToBoxAdapter(
                                    child: Consumer<CharactersProvider>(
                                      builder: (context, providerCharacters,
                                              child) =>
                                          SizedBox(
                                        height:
                                            CustomMethods.height(context, 4.5),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: providerCharacters
                                              .listOfCharacters.length,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            margin: index == 0
                                          ? EdgeInsets.only(
                                              left: CustomMethods.width(
                                                  context, 39),
                                                  right: CustomMethods.width(
                                                  context, 37),
                                            )
                                          : EdgeInsets.only(
                                            left: CustomMethods.width(
                                                  context, 29),
                                              right: CustomMethods.width(
                                                  context, 39),
                                            ),
                                            width: CustomMethods.width(
                                                context, 2.95),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorsClass.milk,
                                                width: CustomMethods.width(
                                                    context, 600),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      CustomMethods.width(
                                                          context, 20)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  providerCharacters
                                                          .listOfCharacters[
                                                              index]
                                                          .img ??
                                                      "https://i.pinimg.com/736x/f6/76/83/f67683016eb44f1fa4ef785fa0f71039.jpg",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            CustomMethods.width(
                                                                context, 20)),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0.37),
                                                        Colors.black
                                                            .withOpacity(0.37)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        CustomMethods.width(
                                                            context, 40)),
                                                    alignment: Alignment.center,
                                                    height: CustomMethods.width(
                                                        context, 10.7),
                                                    decoration: BoxDecoration(
                                                      color: ColorsClass.dark
                                                          .withOpacity(0.83),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        20)),
                                                        bottomRight:
                                                            Radius.circular(
                                                                CustomMethods
                                                                    .width(
                                                                        context,
                                                                        20)),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            providerCharacters
                                                                    .listOfCharacters[
                                                                        index]
                                                                    .name ??
                                                                "...",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: ColorsClass
                                                                  .milk
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontFamily:
                                                                  "PatuaOne",
                                                              fontSize:
                                                                  CustomMethods
                                                                      .width(
                                                                          context,
                                                                          31),
                                                            ),
                                                          ),
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
                                  ),
                                

                                // Space after characters
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: CustomMethods.width(context, 15),
                                  ),
                                ),
                              ],
                            ),
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
