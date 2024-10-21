// Page 3: Weight Screen

import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'number_input.dart';

class BuildWeightScreen extends StatefulWidget {
  final VoidCallback onSubmit; 
  const BuildWeightScreen({super.key, required this.onSubmit});

  @override
  State<BuildWeightScreen> createState() => _BuildWeightScreenState();
}

class _BuildWeightScreenState extends State<BuildWeightScreen> {
  String currentValue = '87';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Step 3 of 7",
          ),
          NumberInputWithUnit(
            title: "HOW MUCH DO YOU WEIGHT?",
            currentValue: currentValue, // Example value
            // unit1: "LBS",
            // unit2: "KG",
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
                UserModel.instance.setWeight = currentValue;
                widget.onSubmit();
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
