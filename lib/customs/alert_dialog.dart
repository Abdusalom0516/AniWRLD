import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAlertDialog{
  static void showExitConfirmation(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: ColorsClass.milk,
        title: const Text(
          'Exit Confirmation',
          style: TextStyle(fontFamily: "PatuaOne"),
        ),
        content: Text('Do you really want to quit?',
            style: TextStyle(
                fontFamily: "PatuaOne",
                color: ColorsClass.dark.withOpacity(0.6),
                fontSize: CustomMethods.width(context, 23))),
        actions: <Widget>[
          TextButton(
            child: Text('No',
                style: TextStyle(
                  fontFamily: "PatuaOne",
                  fontSize: CustomMethods.width(context, 21),
                )),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Yes',
                style: TextStyle(
                    fontFamily: "PatuaOne",
                    fontSize: CustomMethods.width(context, 21))),
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}
}