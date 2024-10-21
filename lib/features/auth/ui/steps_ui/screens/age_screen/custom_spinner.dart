import 'package:flutter/material.dart';

class CustomAgeSpinner extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function(int) onChanged;

  const CustomAgeSpinner(
      {super.key,
      required this.minValue,
      required this.maxValue,
      required this.initialValue,
      required this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CustomAgeSpinnerState createState() => _CustomAgeSpinnerState();
}

class _CustomAgeSpinnerState extends State<CustomAgeSpinner> {
  int _selectedValue = 27;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedValue = widget.minValue + index;
          });
          widget.onChanged(_selectedValue);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final value = widget.minValue + index;
            return Container(
              alignment: Alignment.center,
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: _selectedValue == value
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: _selectedValue == value ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: widget.maxValue - widget.minValue + 1,
        ),
      ),
    );
  }
}
