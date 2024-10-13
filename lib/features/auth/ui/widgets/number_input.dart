import 'package:flutter/material.dart';

class NumberInputWithUnit extends StatefulWidget {
  final String title;
  final String currentValue;
  final String unit1;
  final String unit2;
  final Function(String) onValueChange;

  const NumberInputWithUnit({
    required this.title,
    required this.currentValue,
    required this.unit1,
    required this.unit2,
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
    selectedUnit = widget.unit2; // Default selected unit
    controller = TextEditingController(text: widget.currentValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ToggleButtons(
          isSelected: [selectedUnit == widget.unit1, selectedUnit == widget.unit2],
          onPressed: (index) {
            setState(() {
              selectedUnit = index == 0 ? widget.unit1 : widget.unit2;
            });
          },
          children: [Text(widget.unit1), Text(widget.unit2)],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: (value) => widget.onValueChange(value),
          decoration: InputDecoration(
            suffixText: selectedUnit,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
