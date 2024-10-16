import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  final String unit1; // First unit (e.g., KG or CM)
  final String unit2; // Second unit (e.g., LBS or Feet)
  final Function(String) onUnitChanged; // Callback to inform parent widget of unit change

  const CustomToggleButtons({
    super.key, 
    required this.unit1, 
    required this.unit2, 
    required this.onUnitChanged,
  });

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  late String selectedUnit;

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.unit1; // Default to unit1
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: Colors.grey,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.grey,
      selectedColor: Colors.white,
      isSelected: [
        selectedUnit == widget.unit1,
        selectedUnit == widget.unit2,
      ],
      onPressed: (index) {
        setState(() {
          selectedUnit = index == 0 ? widget.unit1 : widget.unit2;
        });
        widget.onUnitChanged(selectedUnit); // Pass selected unit back to parent widget
      },
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.unit1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedUnit == widget.unit1 ? Colors.black : Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.unit2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedUnit == widget.unit2 ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
