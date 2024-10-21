import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/exercise/ui/widget/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:fit_track_app/features/exercise/ui/widget/training_kind_widget/training_kind_listview.dart';
import 'package:fit_track_app/features/exercise/ui/widget/training_time_widget/training_time_screen.dart';
import 'package:fit_track_app/features/home/ui/home_screen.dart';
import 'package:fit_track_app/features/home/ui/widget/additional_exercise_widget/additional_exercise_listview.dart';
import 'package:flutter/material.dart';

class TrainingDetailsScreen extends StatefulWidget {
  const TrainingDetailsScreen({super.key, required this.exercise});

  final Map<String, dynamic> exercise;

  @override
  State<TrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 380,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/training1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: ColorsManager.blackColor,
                  size: 20,
                ),
              ),
              Positioned(
                top: 350,
                left: MediaQuery.sizeOf(context).width * 0.5 - 160,
                child: Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsManager.whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_fire_department_outlined,
                        color: ColorsManager.blackColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '100 kcal',
                        style: TextStyle(
                          color: ColorsManager.textSecondaryColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 16,
                        width: 1,
                        color: const Color(0xFF707070),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(
                        Icons.timer_outlined,
                        color: ColorsManager.blackColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '10 min',
                        style: TextStyle(
                          color: ColorsManager.textSecondaryColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 483,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Level',
                            style: TextStyle(
                              color: Color(0xFF3A4750),
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Chip(
                            label: const Text('Beginner'),
                            labelStyle: const TextStyle(
                              color: ColorsManager.textBaseColor,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  color: Colors.grey[200] ?? Colors.grey),
                            ),
                            backgroundColor: Colors.grey[200],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                              color: Color(0xFF3A4750),
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Chip(
                            label: const Text('Cardio'),
                            labelStyle: const TextStyle(
                              color: ColorsManager.textBaseColor,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  color: Colors.grey[200] ?? Colors.grey),
                            ),
                            backgroundColor: Colors.grey[200],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                              color: Color(0xFF3A4750),
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Chip(
                            label: const Text('Lose'),
                            labelStyle: const TextStyle(
                              color: ColorsManager.textBaseColor,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  color: Colors.grey[200] ?? Colors.grey),
                            ),
                            backgroundColor: Colors.grey[200],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Exercises with Sitting \nDumbbells',
                    style: TextStyle(
                      color: ColorsManager.textBaseColor,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'There are many variations of passages of Lorem \nIpsum available, but the majority have suffered \nalteration in some form, by injected humour,',
                    style: TextStyle(
                      color: Color(0xFF3A4750),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '3 Weeks - 20 Exercise',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          buildShowBottomSheet(context);
                        },
                        child: Chip(
                          label: const Text('Schedule'),
                          labelStyle: const TextStyle(
                            color: ColorsManager.whiteColor,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(
                                color: ColorsManager.blackColor),
                          ),
                          backgroundColor: ColorsManager.blackColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Exercise Program',
                    style: TextStyle(
                      color: ColorsManager.textBaseColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TrainingKindListview(),
                  const SizedBox(height: 35.0),
                  const AdditionalExerciseListview()
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        child: defaultButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TrainingTimeScreen(),
              ),
            );
          },
          text: 'Start Now',
          fontSize: 22,
          radius: 8,
        ),
      ),
    );
  }
}
