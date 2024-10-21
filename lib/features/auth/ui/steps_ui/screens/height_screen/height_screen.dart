
// Page 5: Height Screen
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import 'number_input_hight.dart';

class BuildHeightScreen extends StatefulWidget {
  final VoidCallback onSubmit; 
  const BuildHeightScreen({super.key, required this.onSubmit});

  @override
  State<BuildHeightScreen> createState() => _BuildHeightScreenState();
}

class _BuildHeightScreenState extends State<BuildHeightScreen> {
  String currentValue = '190'; 
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
            currentValue: currentValue, // Example value
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
                  UserModel.instance.height = currentValue;
                  widget.onSubmit();
                }),
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}