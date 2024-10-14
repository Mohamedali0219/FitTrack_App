import 'package:fit_track_app/features/exercise/ui/widget/training_kind_widget/training_kind_items.dart';
import 'package:flutter/material.dart';

class TrainingKindListview extends StatefulWidget {
  const TrainingKindListview({super.key});

  @override
  State<TrainingKindListview> createState() => _TrainingKindListviewState();
}

class _TrainingKindListviewState extends State<TrainingKindListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> trainingKinds = [
      'Cardio',
      'Legs',
      'Back',
      'Chest',
    ];
    return SizedBox(
      height: 60, // Adjust height as needed
      width: MediaQuery
          .sizeOf(context)
          .width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: trainingKinds.length * 41.0,
        itemCount: trainingKinds.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: TrainingKindItems(
              isSelected: selectedIndex == index,
              kindType: trainingKinds[index],
            ),
          );
        },
      ),
    );
  }
}
