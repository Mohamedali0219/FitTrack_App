import 'package:flutter/material.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/themes/text_styles.dart';

class CustomSelectionButton extends StatelessWidget {
  const CustomSelectionButton(
      {super.key, this.isSelected = false, required this.goalType});
  final bool isSelected;
  final String goalType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.blackColor : Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              goalType,
              style: TextStyles.styleBold(
                context,
                fontSize: 16,
                color: isSelected
                    ? ColorsManager.whiteColor
                    : ColorsManager.textSecondaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class CustomSelectionButton2 extends StatelessWidget {
  const CustomSelectionButton2(
      {super.key,
      this.isSelected = false,
      required this.goalType,
      required this.image});

  final bool isSelected;
  final String goalType;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.blackColor
                : const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Image.asset(
                  image,
                  width: 30,
                  height: 30,
              ),
              const SizedBox(width: 20),
              Text(
                goalType,
                style: TextStyles.styleBold(
                  context,
                  fontSize: 12,
                  color: isSelected
                      ? ColorsManager.whiteColor
                      : ColorsManager.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
