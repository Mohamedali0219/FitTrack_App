import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealDescriptionInfo extends StatelessWidget {
  const MealDescriptionInfo({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280.w,
          child: Text(
            title,
            style: TextStyles.styleBold(
              context,
              fontSize: 20,
              fontFamily: TextStyles.bebasNeue,
              color: ColorsManager.textBaseColor,
            ),
          ),
        ),
        SizedBox(
          width: 400.h,
          child: Text(
            description,
            style: TextStyles.styleSemiBold(
              context,
              fontSize: 12,
              color: ColorsManager.textSecondaryColor,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
