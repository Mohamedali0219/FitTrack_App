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
        const SizedBox(height: 20),
        Text(widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ToggleButtons(
          fillColor: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey,
          selectedColor: Colors.white,
          isSelected: [
            selectedUnit == widget.unit1,
            selectedUnit == widget.unit2
          ],
          onPressed: (index) {
            setState(() {
              selectedUnit = index == 0 ? widget.unit1 : widget.unit2;
            });
          },
          children: [
            Text(widget.unit1,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedUnit == widget.unit1
                        ? Colors.black
                        : Colors.grey)),
            Text(widget.unit2,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedUnit == widget.unit2
                        ? Colors.black
                        : Colors.grey)),
          ],
        ),
        const SizedBox(height: 40),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            widget.onValueChange(value);
            controller.text.isNotEmpty && selectedUnit == widget.unit2
                ? (double.tryParse(controller.text)! * 2.205).toStringAsFixed(0)
                : '0';
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
