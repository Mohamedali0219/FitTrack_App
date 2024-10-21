// Page 4: Goal Weight Screen
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../weight_screen/number_input.dart';

class BuildGoalWeightScreen extends StatefulWidget {
  final VoidCallback onSubmit; 
  const BuildGoalWeightScreen({super.key, required this.onSubmit});

  @override
  State<BuildGoalWeightScreen> createState() => _BuildGoalWeightScreenState();
}

class _BuildGoalWeightScreenState extends State<BuildGoalWeightScreen> {
  String currentValue = '60';
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
            currentValue: currentValue , // Example value
            onValueChange: (value) {
           setState(() {
             currentValue = value;
           });
            },
          ),
          const Spacer(),
          customButton(
                text: 'Next Step',
                onPressed: () {
                  UserModel.instance.setGoalWeight = currentValue;
                  widget.onSubmit();
                }),
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}
