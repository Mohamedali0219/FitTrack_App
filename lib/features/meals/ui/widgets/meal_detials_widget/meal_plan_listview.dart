import 'package:fit_track_app/features/meals/ui/widgets/meal_detials_widget/meal_plan_item.dart';
import 'package:flutter/material.dart';

class MealPlanListView extends StatelessWidget {
  const MealPlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const MealPlanItem();
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[300],
          thickness: 1,
        );
      },
      itemCount: 5,
    );
  }
}
