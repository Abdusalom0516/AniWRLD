import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
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
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomMethods.width(context, 27)),
              child: Column(
                children: [
                  CustomWidgets.height(context, 40),
                  // Search Part
                  Row(
                    children: [
                      // Typing Area Part
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              left: CustomMethods.width(context, 90)),
                          height: CustomMethods.width(context, 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      CustomMethods.width(context, 20)),
                                  bottomLeft: Radius.circular(
                                      CustomMethods.width(context, 20))),
                              border: Border.all(
                                  color: ColorsClass.milk.withOpacity(0.7),
                                  width: 1.3)),
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(
                                decorationColor: Colors.transparent,
                                decorationThickness: 0,
                                color: ColorsClass.milk,
                                fontFamily: "PatuaOne"),
                            cursorColor: ColorsClass.milk,
                            decoration: InputDecoration(
                                label: Text(
                                  "Enter title...",
                                  style: TextStyle(
                                      color: ColorsClass.milk,
                                      fontFamily: "PatuaOne"),
                                ),
                                alignLabelWithHint: false,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "Vinland Saga...",
                                hintStyle: TextStyle(
                                    color: ColorsClass.milk.withOpacity(0.8),
                                    fontFamily: "PatuaOne"),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                      CustomWidgets.width(context, 40),
                      // Request Sending Part
                      Expanded(
                        child: Container(
                          height: CustomMethods.width(context, 7),
                          decoration: BoxDecoration(
                              color: ColorsClass.darkRed,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      CustomMethods.width(context, 20)),
                                  bottomRight: Radius.circular(
                                      CustomMethods.width(context, 20)))),
                          child: TextButton(
                            onPressed: () {
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
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
