import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/ui/widgets/kcal_clock.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/meal_description_info.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/meal_detials_appbar.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/meal_plan_listview.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/nutrient_setion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsDetialsScreen extends StatelessWidget {
  const MealsDetialsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    print(mealModel.name);
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: CustomScrollView(
        slivers: [
          const MealDetialsAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2,
                        color: ColorsManager.whiteColor,
                        child: Column(
                          children: [
                            const KcalAndClockSction(
                                kcal: '250 Kcla', clock: '15 min'),
                            const NutrientSction(
                              fats: '10g',
                              protein: '20g',
                              carbs: '30g',
                            ),
                            SizedBox(height: 8.h)
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      const MealDescriptionInfo(
                        title: 'Healthy balanced vegetarian food',
                        description:
                            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
                      ),
                      SizedBox(
                        width: 280.w,
                        child: Text(
                          'Meal Plan',
                          style: TextStyles.styleBold(
                            context,
                            fontSize: 28,
                            fontFamily: TextStyles.bebasNeue,
                            color: ColorsManager.textBaseColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const MealPlanListView(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
