// Page 4: Goal Weight Screen
import 'package:flutter/material.dart';

import '../weight_screen/number_input.dart';

class BuildGoalWeightScreen extends StatelessWidget {
  const BuildGoalWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Step 4 of 7",
          ),
          NumberInputWithUnit(
            title: "WHAT'S YOUR GOAL WEIGHT?",
            currentValue: "60", // Example value
            onValueChange: (value) {
              // Handle value change logic
            },
          ),
        ],
      ),
    );
  }
}
