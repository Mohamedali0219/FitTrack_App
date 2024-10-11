import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/custom_calender.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/meal_types_listview.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/meals_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Meals PLans'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomCalendar(),
              ),
              SizedBox(height: 16.h),
              const MealTypesListView(),
              SizedBox(height: 16.h),

              // Meals List
              Text('Meals',
                  style: TextStyles.styleBold(context,
                      fontSize: 24, color: ColorsManager.textSecondaryColor)),
              SizedBox(height: 8.h),
              const MealsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
