import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';

class FilterBtnWidget extends StatelessWidget {
  const FilterBtnWidget(
      {super.key, required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: TextStyle(
        color:
            isSelected ? ColorsManager.whiteColor : ColorsManager.textBaseColor,
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
            color: isSelected
                ? ColorsManager.blackColor
                : Colors.grey[200] ?? Colors.grey),
      ),
      backgroundColor: isSelected ? ColorsManager.blackColor : Colors.grey[200],
    );
  }
}
