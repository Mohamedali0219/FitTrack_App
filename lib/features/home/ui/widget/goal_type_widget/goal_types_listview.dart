import 'package:fit_track_app/features/home/ui/widget/goal_type_widget/goal_types_items.dart';
import 'package:flutter/material.dart';

class GoalTypesListview extends StatefulWidget {
  const GoalTypesListview({super.key});

  @override
  State<GoalTypesListview> createState() => _GoalTypesListviewState();
}

class _GoalTypesListviewState extends State<GoalTypesListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> goalTypes = [
      'Loose Weight',
      'Gain Weight',
      'Body Building',
      'Healthy',
    ];
    return SizedBox(
      height: 60, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goalTypes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: GoalTypesItems(
              isSelected: selectedIndex == index,
              goalType: goalTypes[index],
            ),
          );
        },
      ),
    );
  }
}
