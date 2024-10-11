import 'package:fit_track_app/features/home/ui/widget/meal_plans_widget/meal_plans_items.dart';
import 'package:flutter/material.dart';

class MealPlansListview extends StatefulWidget {
  const MealPlansListview({super.key});

  @override
  State<MealPlansListview> createState() => _MealPlansListviewState();
}

class _MealPlansListviewState extends State<MealPlansListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260*2, // Adjust height as needed
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: const MealPlansItems()
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Divider(
              color: Color(0xFF696969),
              thickness: 0,
            ),
          );
        },
      ),
    );
  }
}
