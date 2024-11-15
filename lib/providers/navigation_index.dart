import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class NavigationIndex extends ChangeNotifier {
  int index = 0;

  void changeIndex(BuildContext context, int value) {
    index = value;
    if (value == 0) {
      context.go("/");
    }else if(value == 1){
      context.go("/details");
    }else{
      context.go("/search");
    }

    notifyListeners();
  }
}
