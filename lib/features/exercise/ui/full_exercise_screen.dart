import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/exercise/ui/widget/training_kind_widget/training_kind_listview.dart';
import 'package:fit_track_app/features/home/ui/widget/additional_exercise_widget/additional_exercise_listview.dart';
import 'package:flutter/material.dart';

class FullExerciseScreen extends StatefulWidget {
  const FullExerciseScreen({super.key});

  @override
  State<FullExerciseScreen> createState() => _FullExerciseScreenState();
}

class _FullExerciseScreenState extends State<FullExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Full Exercise',
        isback: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        shrinkWrap: true,
        children: const [
          TrainingKindListview(),
          SizedBox(height: 20),
          AdditionalExerciseListview()
        ],
      ),
    );
  }
}
