import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomNutrientInfoMealPlan extends StatelessWidget {
  final String nutrient;
  final String amount;

  const CustomNutrientInfoMealPlan({
    super.key,
    required this.nutrient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nutrient,
          style: TextStyles.styleSemiBold(
            context,
            fontSize: 14,
            color: ColorsManager.textSecondaryColor,
          ),
        ),
        Text(
          amount,
          style: TextStyles.styleBold(
            context,
            fontSize: 16,
            color: ColorsManager.textBaseColor,
          ),
        ),
      ],
    );
  }
}
