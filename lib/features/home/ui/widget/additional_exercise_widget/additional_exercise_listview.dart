import 'package:fit_track_app/features/exercise/logic/exercise_bloc/exercise_bloc.dart';
import 'package:fit_track_app/features/exercise/logic/exercise_bloc/exercise_state.dart';
import 'package:fit_track_app/features/home/ui/widget/additional_exercise_widget/additional_exercise_items.dart';
import 'package:fit_track_app/features/training/logic/training_bloc/training_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<ExerciseBloc, ExerciseState>
      (builder: (context, state) {
      if (state is ExerciseLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ExerciseLoaded) {
        return SizedBox(
          height: 140 * 3, // Adjust height as needed
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.exercises.length,
            itemBuilder: (context, index) {
              final exercises = state.exercises[index];
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AdditionalExerciseItems(
                    exercise: exercises,
                  ));
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
      } else if (state is ExerciseError) {
        return Center(child: Text('Error: ${state.message}'));
      }
      return Container();
    });
  }
}
