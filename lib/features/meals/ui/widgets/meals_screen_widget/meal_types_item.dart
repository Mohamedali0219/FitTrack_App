import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class MealTypesItems extends StatelessWidget {
  const MealTypesItems(
      {super.key, this.isSelected = false, required this.mealType});

  final bool isSelected;
  final String mealType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 4, left: 4),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.primaryColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(mealType,
          style: TextStyles.styleBold(
            context,
            fontSize: 20,
            color: isSelected
                ? ColorsManager.whiteColor
                : ColorsManager.textSecondaryColor,
          )),
    );
  }
}
