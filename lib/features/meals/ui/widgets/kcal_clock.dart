import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class KcalAndClockSction extends StatelessWidget {
  const KcalAndClockSction({
    super.key,
    required this.kcal,
    required this.clock,
  });
  final String kcal, clock;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.kcalIcon,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '250 Kcal',
            style: TextStyles.styleSemiBold(
              context,
              fontSize: 20,
              color: ColorsManager.textSecondaryColor,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            AppIcons.lineIcon,
            width: 20,
            height: 20,
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            AppIcons.clockIcon,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '15 min',
            style: TextStyles.styleSemiBold(
              context,
              fontSize: 20,
              color: ColorsManager.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
