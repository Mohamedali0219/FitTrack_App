import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/logic/cubit/get_meals_cubit.dart';
import 'package:fit_track_app/features/meals/ui/meals_detials_screen.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMealsCubit, GetMealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<GetMealsCubit>();
        List<MealModel> meals = cubit.meals;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MealsDetialsScreen(
                      mealModel: meals[index],
                    ),
                  ),
                );
              },
              child: MealItem(
                mealModel: meals[index],
              ),
            );
          },
        );
      },
    );
  }
}
