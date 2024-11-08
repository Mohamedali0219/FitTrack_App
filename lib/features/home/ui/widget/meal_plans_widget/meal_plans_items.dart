import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:flutter/material.dart';

class MealPlansItems extends StatelessWidget {
  const MealPlansItems({super.key, required this.meal});

  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 155,
            decoration: ShapeDecoration(
              image:
              DecorationImage(image: NetworkImage(meal.imageUrl), fit: BoxFit.cover),
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            meal.name,
            style: TextStyle(
              color: ColorsManager.textBaseColor,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            meal.calories.toString() + ' Kcal',
            style: TextStyle(
              color: ColorsManager.textSecondaryColor,
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
