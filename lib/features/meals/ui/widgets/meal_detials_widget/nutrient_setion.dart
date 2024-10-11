import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/nutrient_item.dart';
import 'package:flutter/material.dart';

class NutrientSction extends StatelessWidget {
  const NutrientSction({
    super.key,
    required this.fats,
    required this.protein,
    required this.carbs,
  });

  final String fats, protein, carbs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NutrientItem(
          nutrient: 'Fats',
          amount: fats,
        ),
        NutrientItem(
          nutrient: 'Protein',
          amount: protein,
        ),
        NutrientItem(
          nutrient: 'Carbs',
          amount: carbs,
        ),
      ],
    );
  }
}
