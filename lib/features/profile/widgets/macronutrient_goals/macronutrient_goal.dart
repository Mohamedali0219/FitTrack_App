import 'package:flutter/material.dart';

import 'macronutrient_goals_item.dart';

class MacronutrientGoals extends StatelessWidget {
  const MacronutrientGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MacronuTrientGoalsItem(
              image: 'assets/images/protine.png',
              text1: 'Protein',
              text2: '130 ',
              text3: 'Grams per day',
            ),
            SizedBox(width: 15),
            MacronuTrientGoalsItem(
              image: 'assets/images/carbs.png',
              text1: 'Carbs',
              text2: '235 ',
              text3: 'Grams per day',
            ),
            SizedBox(width: 15),
            MacronuTrientGoalsItem(
              image: 'assets/images/fat.png',
              text1: 'Fat',
              text2: '60 ',
              text3: 'Grams per day',
            ),
          ]),
    );
  }
}
