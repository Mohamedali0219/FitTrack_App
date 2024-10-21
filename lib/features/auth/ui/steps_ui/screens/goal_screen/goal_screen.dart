// Page 7: Goal Screen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track_app/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/model/user.dart';
import '../../../widgets/custom_button.dart';
import '../finish_screen/fihish_screen.dart';
import '../fitness_level_screen/custom_select_button.dart';

class BuildGoalScreen extends StatefulWidget {
  final VoidCallback onSubmit;
  const BuildGoalScreen({super.key, required this.onSubmit});

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
          customButton(
              text: 'Finish Steps',
              onPressed: () {
                UserModel.instance.goal = goalTypes[selectedIndex];
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(UserModel.instance.uid)
                    .update(UserModel.instance.toMapAdditionalData())
                    .then((value) => {
                          SharedPreference().setString(
                              key: "user", value: UserModel.instance.getUID!)
                        });
                widget.onSubmit();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FinishScreen(),
                  ),
                );
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
