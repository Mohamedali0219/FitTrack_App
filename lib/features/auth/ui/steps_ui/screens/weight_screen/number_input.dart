import 'package:flutter/material.dart';
import 'custom_toggle_buttons.dart'; // Import your custom widget

class NumberInputWithUnit extends StatefulWidget {
  final String title;
  final String currentValue;
  final Function(String) onValueChange;

  const NumberInputWithUnit({
    required this.title,
    required this.currentValue,
    required this.onValueChange,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NumberInputWithUnitState createState() => _NumberInputWithUnitState();
}

class _NumberInputWithUnitState extends State<NumberInputWithUnit> {
  late String selectedUnit;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    selectedUnit = 'KG'; // Default selected unit
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
      double weight = double.tryParse(controller.text) ?? 0.0;

      if (selectedUnit == 'LBS') {
        weight = (weight * 2.205); // Convert KG to LBS
      } else {
        weight = (weight / 2.205); // Convert LBS to KG
      }

      // Update the text field with the converted value
      controller.text = weight.toStringAsFixed(0);
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
          unit1: 'KG',
          unit2: 'LBS',
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
