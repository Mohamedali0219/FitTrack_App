import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';

class MealPlansItems extends StatelessWidget {
  const MealPlansItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 155,
            decoration: const ShapeDecoration(
              image: DecorationImage(image: AssetImage('assets/images/meal1.png')),
              shape: ContinuousRectangleBorder(),
            ),
          ),
          const SizedBox(height: 15,),
          const Text(
            'Greek salad with lettuce, green onion, ',
            style: TextStyle(
              color: ColorsManager.textBaseColor,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8,),
          const Text(
            '150 kcal',
            style: TextStyle(
              color: ColorsManager.textSecondaryColor,
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
