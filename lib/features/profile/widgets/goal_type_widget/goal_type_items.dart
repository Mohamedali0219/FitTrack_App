import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryGoalTypeItems extends StatelessWidget {
  const CategoryGoalTypeItems(
      {super.key,
      this.isSelected = false,
      required this.categoryTypeName,
      required this.categoryTypeImage});

  final bool isSelected;
  final String categoryTypeName;
  final String categoryTypeImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 61,
            height: 61,
            decoration: ShapeDecoration(
              image: DecorationImage(image: AssetImage(categoryTypeImage)),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryTypeName,
            style: TextStyles.styleBold(
              context,
              fontSize: 11,
              color: ColorsManager.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
