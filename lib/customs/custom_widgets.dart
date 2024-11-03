import 'package:anime_world/customs/custom_methods.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static width(BuildContext context, double value) {
    return SizedBox(width: CustomMethods.width(context, value),);
  }

   static height(BuildContext context, double value) {
    return SizedBox(height: CustomMethods.width(context, value),);
  }
}
