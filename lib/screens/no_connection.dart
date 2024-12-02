import 'package:anime_world/config/colors.dart';
import 'package:anime_world/customs/custom_methods.dart';
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  backgroundColor: ColorsClass.dark,
                  body: SizedBox(
                    width: double.infinity,
                    child: Transform.translate(
                      offset: Offset(0, -CustomMethods.width(context, 11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi_off_rounded,
                              color: ColorsClass.darkRed,
                              size: CustomMethods.width(context, 1.7)),
                        ],
                      ),
                    ),
                  ),
                );
  }
}