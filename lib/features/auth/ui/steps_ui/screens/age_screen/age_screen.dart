// Page 2: Age Selection Screen
import 'package:flutter/material.dart';

import '../../../../data/model/user.dart';
import '../../../widgets/custom_button.dart';
import 'custom_spinner.dart';

class BuildAgeScreen extends StatefulWidget {
  final VoidCallback onSubmit; 
  const BuildAgeScreen({super.key, required this.onSubmit});

  @override
  State<BuildAgeScreen> createState() => _BuildAgeScreenState();
}

class _BuildAgeScreenState extends State<BuildAgeScreen> {
  int selectedAge = 20;
  @override
  Widget build(BuildContext context) {
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
            initialValue: selectedAge,
            onChanged: (value) => setState(() => selectedAge = value),
          ),
          const Spacer(),
          customButton(
              text: 'Next Step',
              onPressed: () {
                UserModel.instance.setAge = selectedAge;
                widget.onSubmit();
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
