
// Page 5: Height Screen
import 'package:flutter/material.dart';

import 'number_input_hight.dart';

class BuildHeightScreen extends StatelessWidget {
  const BuildHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Step 5 of 7",
          ),
          NumberInputHight(
            title: "HOW MUCH DO YOU HEIGHT?",
            currentValue: "180", // Example value
            onValueChange: (value) {
              // Handle value change logic
            },
          ),
        ],
      ),
    );
  }
}