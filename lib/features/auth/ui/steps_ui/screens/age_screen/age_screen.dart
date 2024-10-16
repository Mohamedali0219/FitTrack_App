
// Page 2: Age Selection Screen
import 'package:flutter/material.dart';

import 'custom_spinner.dart';

class BuildAgeScreen extends StatelessWidget {
  const BuildAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedAge = 27;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Step 2 of 7"),
          const Text(
            "HOW OLD ARE YOU?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          CustomAgeSpinner(
            minValue: 10,
            maxValue: 100,
            initialValue: 27,
            onChanged: (value) {
              selectedAge = value;
              
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
