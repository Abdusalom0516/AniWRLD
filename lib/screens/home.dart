import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: (value) {},
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined) , label: "Home", activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_sharp), label: "Seasons"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings", activeIcon: Icon(Icons.settings)),
          ]),
    );
  }
}
