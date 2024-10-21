import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/text_styles.dart';

class InfoRowItem extends StatelessWidget {
  const InfoRowItem(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstText,
          style: TextStyles.styleMedium(context,
              fontSize: 20, color: ColorsManager.blackColor),
        ),
        Text(
          secondText,
          style: TextStyles.styleRegular(context,
              fontSize: 16, color: ColorsManager.textBaseColor),
        ),
      ],
    );
  }
}
