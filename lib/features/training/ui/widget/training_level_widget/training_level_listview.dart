import 'package:fit_track_app/features/training/ui/widget/training_level_widget/training_level_Items.dart';
import 'package:flutter/material.dart';

class TrainingLevelListview extends StatefulWidget {
  const TrainingLevelListview({super.key});

  @override
  State<TrainingLevelListview> createState() => _TrainingLevelListviewState();
}

class _TrainingLevelListviewState extends State<TrainingLevelListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> trainingLevels = [
      'Beginner',
      'Intermediate',
      'Advanced',
    ];
    return SizedBox(
      height: 60, // Adjust height as needed
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: trainingLevels.length * 41.0,
        itemCount: trainingLevels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: TrainingLevelItems(
              isSelected: selectedIndex == index,
              levelType: trainingLevels[index],
            ),
          );
        },
      ),
    );
  }
}
