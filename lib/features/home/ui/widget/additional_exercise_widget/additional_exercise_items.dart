import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/exercise/ui/widget/training_screen/training_screen.dart';
import 'package:flutter/material.dart';

class AdditionalExerciseItems extends StatelessWidget {
  const AdditionalExerciseItems({super.key, required this.exercise});

  final Map<String, dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrainingDetailsScreen(exercise: exercise,),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(exercise['imageUrl']),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercise['name'],
                style: const TextStyle(
                  color: ColorsManager.textBaseColor,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_outlined,
                    color: Color(0xFF00ADB5),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    exercise['kcal'],
                    style: const TextStyle(
                      color: ColorsManager.textSecondaryColor,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 8,
                    width: 1,
                    color: const Color(0xFF707070),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.timer_outlined,
                    color: Color(0xFF00ADB5),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${exercise['time']} min',
                    style: const TextStyle(
                      color: ColorsManager.textSecondaryColor,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                exercise['description'],
                style: const TextStyle(
                  color: Color(0xFF303841),
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
