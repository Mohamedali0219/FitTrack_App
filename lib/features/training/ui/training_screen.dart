import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/filter/ui/filter_screen.dart';
import 'package:fit_track_app/features/home/ui/widget/popular_exercise_widget/popular_exercise_listview.dart';
import 'package:fit_track_app/features/training/ui/widget/training_level_widget/training_level_listview.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Training',
        isback: true,
        hasAction: true,
        icon: 'assets/icons/Filter-btn.svg',
        onPressed: () {
          context.pop();
        },
        hasActionOnPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FilterScreen(),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: const [
          TrainingLevelListview(),
          SizedBox(height: 30),
          SizedBox(
            width: 140.22,
            child: Text(
              'Popular Training',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 15),
          PopularExerciseListview(),
        ],
      ),
    );
  }
}
