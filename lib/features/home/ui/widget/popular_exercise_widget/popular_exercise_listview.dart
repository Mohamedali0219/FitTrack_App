import 'package:fit_track_app/features/home/ui/widget/popular_exercise_widget/popular_exercise_items.dart';
import 'package:flutter/material.dart';

class PopularExerciseListview extends StatefulWidget {
  const PopularExerciseListview({super.key});

  @override
  State<PopularExerciseListview> createState() => _PopularExerciseListviewState();
}

class _PopularExerciseListviewState extends State<PopularExerciseListview> {
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
            child: const PopularExerciseItems()
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
