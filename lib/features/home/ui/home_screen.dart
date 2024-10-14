import 'package:fit_track_app/features/category/ui/category_screen.dart';
import 'package:fit_track_app/features/exercise/ui/full_exercise_screen.dart';
import 'package:fit_track_app/features/home/ui/widget/additional_exercise_widget/additional_exercise_listview.dart';
import 'package:fit_track_app/features/home/ui/widget/adv_part_widget/adv_part_widget.dart';
import 'package:fit_track_app/features/home/ui/widget/category_type_widget/category_type_listview.dart';
import 'package:fit_track_app/features/home/ui/widget/goal_type_widget/goal_types_listview.dart';
import 'package:fit_track_app/features/home/ui/widget/header_part_widget/header_part_widget.dart';
import 'package:fit_track_app/features/home/ui/widget/home_app_bar_widget/home_app_bar_widget.dart';
import 'package:fit_track_app/features/home/ui/widget/meal_plans_widget/meal_plans_listview.dart';
import 'package:fit_track_app/features/home/ui/widget/popular_exercise_widget/popular_exercise_listview.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:fit_track_app/features/training/ui/training_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeAppBarWidget(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdvPartWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  HeaderPartWidget(onPressed: (){}, title: 'Select your Goal', hasSeeAll: false,),
                  const SizedBox(
                    height: 15,
                  ),
                  const GoalTypesListview(),
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderPartWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen(),),);}, title: 'Category', hasSeeAll: true,),
                  const SizedBox(
                    height: 20,
                  ),
                  const CategoryTypeListview(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(height: 0, color: Color(0xFF696969), thickness: 0,),
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderPartWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainingScreen(),),);}, title: 'Popular Exercise', hasSeeAll: true,),
                  const PopularExerciseListview(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(height: 0, color: Color(0xFF696969), thickness: 0,),
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderPartWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MealsScreen(),),);}, title: 'Meal Plans', hasSeeAll: true,),
                  const MealPlansListview(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(height: 0, color: Color(0xFF696969), thickness: 0,),
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderPartWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const FullExerciseScreen(),),);}, title: 'Additional Exercise', hasSeeAll: true,),
                  const AdditionalExerciseListview()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
