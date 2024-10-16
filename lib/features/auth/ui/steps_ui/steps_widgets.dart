import 'package:fit_track_app/features/auth/ui/widgets/number_input_hight.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_grid.dart';
import '../widgets/custom_select_button.dart';
import '../widgets/custom_spinner.dart';
import '../widgets/number_input.dart';

// Page 1: Favorite Selection Screen
class BuildFavoriteScreen extends StatelessWidget {
  const BuildFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Step 1 of 7"),
          const Text(
            "SELECT YOUR FAVORITE",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                CustomGridItem(
                  title: "Running",
                  imageUrl:
                      'assets/images/Ellipse 212.png', // Example image path
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Walking",
                  imageUrl: 'assets/images/Ellipse 207.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Meal Plan",
                  imageUrl: 'assets/images/Ellipse 208.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Cycling",
                  imageUrl: 'assets/images/Ellipse 209.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Yoga",
                  imageUrl: 'assets/images/Ellipse 210.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Health",
                  imageUrl: 'assets/images/Ellipse 211.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Page 2: Age Selection Screen
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

// Page 3: Weight Screen
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

// Page 4: Goal Weight Screen
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

// Page 5: Height Screen
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
          NumberInputWithUnit2(
            currentValue: "175",
            onValueChange: (value) {},
            title: "WHAT'S YOUR HEIGHT?",
          )
        ],
      ),
    );
  }
}

// Page 6: Fitness Level Screen
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

// Page 7: Goal Screen
class BuildGoalScreen extends StatefulWidget {
  const BuildGoalScreen({super.key});

  @override
  State<BuildGoalScreen> createState() => _BuildGoalScreenState();
}

class _BuildGoalScreenState extends State<BuildGoalScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> goalTypes = [
      "Wight Loss",
      "Gain Weight",
      "Improve Fitness",
    ];
    final List<String> image = [
      "assets/images/weight-loss.png",
      "assets/images/Group 56253.png",
      "assets/images/Path 875.png",
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Step 7 of 7"),
          const Text(
            "WHAT'S YOUR GOAL?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Expanded(
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
                  child: CustomSelectionButton2(
                    image: image[index],
                    isSelected: selectedIndex == index,
                    goalType: goalTypes[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
