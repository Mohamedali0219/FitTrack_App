import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/custom_nutrient_info_meal_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealPlanItem extends StatelessWidget {
  const MealPlanItem({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              mealModel.imageUrl,
              width: 120.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            children: [
              SizedBox(
                width: 210.w,
                child: Text(
                  '${mealModel.name}',
                  style: TextStyles.styleBold(
                    context,
                    fontSize: 17,
                    color: ColorsManager.textBaseColor,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Nutrients
              SizedBox(
                width: 210.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNutrientInfoMealPlan(
                      nutrient: 'Fats',
                      amount: '10g',
                    ),
                    CustomNutrientInfoMealPlan(
                      nutrient: 'Protein',
                      amount: '20g',
                    ),
                    CustomNutrientInfoMealPlan(
                      nutrient: 'Carbs',
                      amount: '30g',
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
