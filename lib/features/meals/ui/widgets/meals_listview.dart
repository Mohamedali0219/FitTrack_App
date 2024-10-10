import 'package:fit_track_app/features/meals/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({
    super.key,
  });

  // List of meal names or any other data you need

  @override
  Widget build(BuildContext context) {
    final List<String> meals = [
      'Oatmeal with Fruits',
      'Grilled Chicken Salad',
      'Veggie Pasta',
      'Fruit Salad',
      'Grilled Chicken Salad',
      'Veggie Pasta',
      'Fruit Salad',
    ];
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          mealName: meals[index], // Pass any necessary data to MealItem
        );
      },
    );
  }
}
