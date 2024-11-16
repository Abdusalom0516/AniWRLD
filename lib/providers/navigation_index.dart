import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class NavigationIndex extends ChangeNotifier {
  int index = 0;

  void changeIndex(BuildContext context, int value) {
    index = value;
    if (value == 0) {
      context.push("/");
    } else if (value == 1) {
      context.push("/details");
    } else {
      context.push("/search");
    }

    notifyListeners();
  }
}
