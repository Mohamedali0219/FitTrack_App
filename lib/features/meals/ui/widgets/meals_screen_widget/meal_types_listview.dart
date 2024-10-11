import 'package:fit_track_app/features/meals/ui/widgets/meals_screen_widget/meal_types_item.dart';
import 'package:flutter/material.dart';

class MealTypesListView extends StatefulWidget {
  const MealTypesListView({
    super.key,
  });

  @override
  MealTypesListViewState createState() => MealTypesListViewState();
}

class MealTypesListViewState extends State<MealTypesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> mealTypes = [
      'Breakfast',
      'Lunch',
      'Dinner',
      'Snacks',
    ];
    return SizedBox(
      height: 60, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealTypes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: MealTypesItems(
              isSelected: selectedIndex == index,
              mealType: mealTypes[index],
            ),
          );
        },
      ),
    );
  }
}
