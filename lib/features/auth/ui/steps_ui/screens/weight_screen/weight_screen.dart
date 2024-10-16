// Page 3: Weight Screen


import 'package:flutter/material.dart';

import 'number_input.dart';

class BuildWeightScreen extends StatelessWidget {
  const BuildWeightScreen({super.key});

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
            currentValue: "87", // Example value
            // unit1: "LBS",
            // unit2: "KG",
            onValueChange: (value) {
              // Handle value change logic
            },
          ),
        ],
      ),
    );
  }
}