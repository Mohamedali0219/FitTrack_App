import 'package:fit_track_app/features/home/ui/widget/additional_exercise_widget/additional_exercise_items.dart';
import 'package:flutter/material.dart';

class AdditionalExerciseListview extends StatefulWidget {
  const AdditionalExerciseListview({super.key});

  @override
  State<AdditionalExerciseListview> createState() =>
      _AdditionalExerciseListviewState();
}

class _AdditionalExerciseListviewState
    extends State<AdditionalExerciseListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140 * 3, // Adjust height as needed
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: const AdditionalExerciseItems());
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
