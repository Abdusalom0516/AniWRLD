import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:anime_world/customs/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAlertDialog {
  static void showExitConfirmation(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.73),
      builder: (context) {
        return AlertDialog.adaptive(
          titlePadding: EdgeInsets.only(
            top: CustomMethods.width(context, 25),
            bottom: CustomMethods.width(context, 275.5),
          ),
          contentPadding: EdgeInsets.only(
            bottom: CustomMethods.width(context, 16.5),
          ),
          backgroundColor: Colors.grey,
          title: Column(
            children: [
              Icon(
                Icons.error,
                color: ColorsClass.lightBlue,
                size: CustomMethods.width(context, 11),
              ),
              CustomWidgets.height(context, 105),
              Text(
                'Exit Confirmation',
                style: TextStyle(
                    fontFamily: "PatuaOne",
                    fontSize: CustomMethods.height(context, 27)),
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do you really want to quit?',
                  style: TextStyle(
                      fontFamily: "PatuaOne",
                      color: ColorsClass.dark.withOpacity(0.6),
                      fontSize: CustomMethods.width(context, 23))),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: CustomMethods.height(context, 15),
                  width: CustomMethods.width(context, 3.7),
                  decoration: BoxDecoration(
                      color: ColorsClass.lightBlue,
                      borderRadius: BorderRadius.circular(
                          CustomMethods.width(context, 45))),
                  child: TextButton(
                    child: Text('No',
                        style: TextStyle(
                            fontFamily: "PatuaOne",
                            fontSize: CustomMethods.width(context, 21),
                            color: ColorsClass.milk)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                CustomWidgets.width(context, 25),
                Container(
                  height: CustomMethods.height(context, 15),
                  width: CustomMethods.width(context, 3.7),
                  decoration: BoxDecoration(
                      color: ColorsClass.dark.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                          CustomMethods.width(context, 45))),
                  child: TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: "PatuaOne",
                        fontSize: CustomMethods.width(context, 21),
                        color: ColorsClass.milk,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
