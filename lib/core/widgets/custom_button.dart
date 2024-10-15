import 'package:flutter/material.dart';

import '../themes/colors_manager.dart';


Widget defaultButton({
  // login and signUp button
  final bool isLoading = false,
  double width = double.infinity,
  double height = 50.5,
  Color background = ColorsManager.primaryColor,
  Color broder = ColorsManager.primaryColor,
  Color textColor = Colors.white,
  double radius = 0.0,
  required Function() onPressed,
  required String text,
  required double fontSize,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
        border: Border.all(color: broder),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
      ),
    );
