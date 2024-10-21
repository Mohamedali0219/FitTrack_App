import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/text_styles.dart';

class MacronuTrientGoalsItem extends StatelessWidget {
  const MacronuTrientGoalsItem(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3});

  final String image;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 3),
        Text(
          text1,
          style: TextStyles.styleBold(
            context,
            fontSize: 12,
            color: ColorsManager.blackColor,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          text2,
          style: TextStyles.styleSemiBold(
            context,
            fontSize: 12,
            color: ColorsManager.blackColor,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          text3,
          style: TextStyles.styleRegular(
            context,
            fontSize: 12,
            color: ColorsManager.blackColor,
          ),
        ),
      ],
    );
  }
}
