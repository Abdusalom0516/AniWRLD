import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:anime_world/providers/navigation_index.dart';
import 'package:anime_world/providers/search_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  // ignore: prefer_final_fields
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
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
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp),
              label: "Details",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
              activeIcon: Icon(Icons.settings),
            ),
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: ColorsClass.milk,
            ))),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorsClass.dark,
                    floating: false,
                    title: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: CustomMethods.width(context, 90),
                            ),
                            height: CustomMethods.width(context, 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  CustomMethods.width(context, 20),
                                ),
                                bottomLeft: Radius.circular(
                                  CustomMethods.width(context, 20),
                                ),
                              ),
                              border: Border.all(
                                color: ColorsClass.milk.withOpacity(0.7),
                                width: 1.3,
                              ),
                            ),
                            child: TextField(
                              focusNode: _focusNode,
                              autofocus: true,
                              controller: _searchController,
                              onSubmitted: (value) {
                                Provider.of<SearchResults>(context,
                                        listen: false)
                                    .getSearchResultsByTitle(
                                        _searchController.text);
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              style: TextStyle(
                                decorationColor: Colors.transparent,
                                decorationThickness: 0,
                                color: ColorsClass.milk,
                                fontFamily: "PatuaOne",
                              ),
                              cursorColor: ColorsClass.milk,
                              decoration: InputDecoration(
                                label: Text(
                                  "Enter title...",
                                  style: TextStyle(
                                    color: ColorsClass.milk,
                                    fontFamily: "PatuaOne",
                                  ),
                                ),
                                alignLabelWithHint: false,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "Vinland Saga...",
                                hintStyle: TextStyle(
                                  color: ColorsClass.milk.withOpacity(0.8),
                                  fontFamily: "PatuaOne",
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomWidgets.width(context, 40),
                        Expanded(
                          child: Container(
                            height: CustomMethods.width(context, 7),
                            decoration: BoxDecoration(
                              color: ColorsClass.darkRed,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  CustomMethods.width(context, 20),
                                ),
                                bottomRight: Radius.circular(
                                  CustomMethods.width(context, 20),
                                ),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Provider.of<SearchResults>(context,
                                        listen: false)
                                    .getSearchResultsByTitle(
                                        _searchController.text);
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                Icons.search,
                                color: ColorsClass.milk,
                                size: CustomMethods.width(context, 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SliverList.list(
                  //     children: [CustomWidgets.height(context, 20)]),
                  // Bottom Part
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: CustomMethods.width(context, 20),
                      horizontal: CustomMethods.width(context, 20),
                    ),
                    sliver: Consumer<SearchResults>(
                      builder: (context, provider, child) => SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
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
                                image: NetworkImage(provider
                                        .searchResultsList[index].img ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmVq-OmHL5H_5P8b1k306pFddOe3049-il2A&s"),
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
                                    gradient: LinearGradient(colors: [
                                      Colors.black.withOpacity(0.37),
                                      Colors.black.withOpacity(0.37),
                                    ]),
                                  ),
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
                                      color: ColorsClass.dark.withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                          CustomMethods.width(context, 20),
                                        ),
                                        bottomRight: Radius.circular(
                                          CustomMethods.width(context, 20),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            provider.searchResultsList[index]
                                                    .title ??
                                                "Unknown",
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: ColorsClass.milk
                                                  .withOpacity(0.7),
                                              fontFamily: "PatuaOne",
                                              fontSize: CustomMethods.width(
                                                  context, 27),
                                            ),
                                          ),
                                        ),
                                        CustomWidgets.width(context, 40),
                                        Text(
                                          "⭐ ${provider.searchResultsList[index].score ?? "5"}",
                                          style: TextStyle(
                                            color: ColorsClass.milk
                                                .withOpacity(0.7),
                                            fontFamily: "PatuaOne",
                                            fontSize: CustomMethods.width(
                                                context, 27),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }, childCount: provider.searchResultsList.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.37,
                          mainAxisSpacing: CustomMethods.width(context, 25),
                          crossAxisSpacing: CustomMethods.width(context, 25),
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
    );
  }
}

// Disabling the Scroll Effect
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
