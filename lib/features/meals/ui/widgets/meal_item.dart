import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/core/utils/app_icons.dart';
import 'package:fit_track_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealName});

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.whiteColor,
      child: Column(
        children: [
          Container(
            height: 230.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.food1Image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsManager.blackColor.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mealName,
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 24,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor:
                              ColorsManager.whiteColor.withOpacity(0.4),
                          child: const Icon(
                            size: 30,
                            Icons.favorite_border,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorsManager.blackColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oatmeal with Fruits',
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 24,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.kcalIcon,
                  width: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '250 Kcal',
                  style: TextStyles.styleRegular(
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
                  style: TextStyles.styleRegular(
                    context,
                    fontSize: 20,
                    color: ColorsManager.textSecondaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
