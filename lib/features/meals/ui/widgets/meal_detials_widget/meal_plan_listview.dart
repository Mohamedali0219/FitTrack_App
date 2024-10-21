import 'package:fit_track_app/features/meals/logic/cubit/get_meals_cubit.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/meal_plan_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealPlanListView extends StatelessWidget {
  const MealPlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMealsCubit, GetMealsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<GetMealsCubit>();
        var meals = cubit.meals;
        return ListView.separated(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          
          itemBuilder: (context, index) {
            return  MealPlanItem(
              mealModel: meals[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[300],
              thickness: 1,
            );
          },
          itemCount: meals.length,
        );
      },
    );
  }
}
