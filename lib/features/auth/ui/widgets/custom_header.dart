import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/utils/app_icons.dart';

class ScreenHeader extends StatelessWidget {
  final VoidCallback onSkip;

  const ScreenHeader({
    required this.onSkip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: const EdgeInsets.only(bottom: 16),
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppIcons.arrowBackIcon,
            colorFilter: const ColorFilter.mode(
                ColorsManager.textBaseColor, BlendMode.srcIn),
            width: 10,
          ),
        ),
        TextButton(
            onPressed: onSkip,
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
