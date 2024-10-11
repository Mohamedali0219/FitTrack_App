import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/core/utils/app_icons.dart';
import 'package:fit_track_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealDetialsAppBar extends StatelessWidget {
  const MealDetialsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      // forceMaterialTransparency: true,
      backgroundColor: ColorsManager.primaryColor,
      pinned: true,
      leading: IconButton(
        padding: const EdgeInsets.only(bottom: 16),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          AppIcons.arrowBackIcon,
          colorFilter: const ColorFilter.mode(
              ColorsManager.textBaseColor, BlendMode.srcIn),
          width: 15,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsManager.blackColor.withOpacity(0.5),
          ),
          child: Text(
            'Oatmeal with Fruits',
            style: TextStyles.styleBold(context,
                fontSize: 16, color: ColorsManager.whiteColor),
          ),
        ),
        background: Hero(
          tag: 'Oatmeal with Fruits',
          child: Image.asset(
            AppImage.food1Image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
