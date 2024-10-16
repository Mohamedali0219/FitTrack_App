// Page 6: Fitness Level Screen
import 'package:flutter/material.dart';

import 'custom_select_button.dart';

class BuildFitnessLevelScreen extends StatefulWidget {
  const BuildFitnessLevelScreen({super.key});

  @override
  State<BuildFitnessLevelScreen> createState() =>
      _BuildFitnessLevelScreenState();
}

class _BuildFitnessLevelScreenState extends State<BuildFitnessLevelScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> goalTypes = [
      "BEGINNER",
      "INTERMEDIATE",
      "AVANCED",
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Step 6 of 7"),
          const Text(
            "WHAT'S YOUR FITNESS LEVEL?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: goalTypes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CustomSelectionButton(
                      isSelected: selectedIndex == index,
                      goalType: goalTypes[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}