import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class GoalTypesItems extends StatelessWidget {
  const GoalTypesItems(
      {super.key, this.isSelected = false, required this.goalType});

  final bool isSelected;
  final String goalType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 4, left: 4),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.blackColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        goalType,
        style: TextStyles.styleBold(
          context,
          fontSize: 11,
          color: isSelected
              ? ColorsManager.whiteColor
              : ColorsManager.textSecondaryColor,
        ),
      ),
    );
  }
}
