import 'package:flutter/material.dart';

import '../weight_screen/custom_toggle_buttons.dart';

class NumberInputHight extends StatefulWidget {
  const NumberInputHight({super.key, required this.currentValue, required this.title, required this.onValueChange});

  final String title ;
  final Function(String) onValueChange;
  final String currentValue;


  @override
  State<NumberInputHight> createState() => _NumberInputHightState();
}

class _NumberInputHightState extends State<NumberInputHight> {
 late String selectedUnit;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    selectedUnit = 'cm'; // Default selected unit
    controller = TextEditingController(text: widget.currentValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onUnitChanged(String newUnit) {
    setState(() {
      selectedUnit = newUnit;
      _convertValue(); // Convert value when unit changes
    });
  }

  void _convertValue() {
    if (controller.text.isNotEmpty) {
      double height = double.tryParse(controller.text) ?? 0.0;

      if (selectedUnit == 'FEET') {
        height = height * 30.48; // Convert FEET to CM
      } else {
        height = height / 30.48; // Convert CM to FEET
      }

      // Update the text field with the converted value
      controller.text = height.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomToggleButtons(
          unit1: 'cm',
          unit2: 'feet',
          onUnitChanged: _onUnitChanged, // Pass the callback
        ),
        const SizedBox(height: 40),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            widget.onValueChange(value);
          },
          decoration: InputDecoration(
            suffixText: selectedUnit,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey[800]!),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
