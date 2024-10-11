import 'package:fit_track_app/features/meals/ui/meals_detials_screen.dart';
import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/meal_item.dart';
import 'package:flutter/material.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({
    super.key,
  });

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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MealsDetialsScreen(),
              ),
            );
          },
          child: MealItem(
            mealName: meals[index],
          ),
        );
      },
    );
  }
}
