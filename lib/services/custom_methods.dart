import 'package:flutter/material.dart';

class CustomMethods{
  static double width(BuildContext context, int value) {
    return MediaQuery.of(context).size.width / value;
  }
}