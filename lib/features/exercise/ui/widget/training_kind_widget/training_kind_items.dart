import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TrainingKindItems extends StatelessWidget {
  const TrainingKindItems(
      {super.key, required this.isSelected, required this.kindType});

  final bool isSelected;

  final String kindType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 4, left: 4),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.blackColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          kindType,
          style: TextStyles.styleBold(
            context,
            fontSize: 11,
            color: isSelected
                ? ColorsManager.whiteColor
                : ColorsManager.textSecondaryColor,
          ),
        ),
      ),
    );
  }
}
