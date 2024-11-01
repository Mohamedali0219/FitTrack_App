import 'package:fit_track_app/features/home/ui/widget/popular_exercise_widget/popular_exercise_items.dart';
import 'package:fit_track_app/features/training/logic/popular_exercise_bloc/popular_exercise_bloc.dart';
import 'package:fit_track_app/features/training/logic/popular_exercise_bloc/popular_exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularExerciseListview extends StatefulWidget {
  const PopularExerciseListview({super.key});

  @override
  State<PopularExerciseListview> createState() =>
      _PopularExerciseListviewState();
}

class _PopularExerciseListviewState extends State<PopularExerciseListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularExerciseBloc, PopularExerciseState>(
      builder: (context, state) {
        if (state is PopularExerciseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularExerciseLoaded) {
          return SizedBox(
            height: 260 * 5, // Adjust height as needed
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.popularExercises.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: PopularExerciseItems(
                    popularExercise: state.popularExercises[index],
                  ),
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
        } else if (state is PopularExerciseError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
