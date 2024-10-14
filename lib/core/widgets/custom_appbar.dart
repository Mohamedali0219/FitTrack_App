import 'package:fit_track_app/core/helper/Extension/functions.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.isback = false, this.hasAction = false, this.icon = '', this.onPressed, this.isText = false, this.hasActionOnPressed});

  final String title;
  final bool isback;
  final bool hasAction;
  final bool isText;
  final String icon;
  final void Function()? onPressed;
  final void Function()? hasActionOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Visibility(
            visible: isback,
            child: Positioned(
              left: 0,
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorsManager.textBaseColor,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyles.styleRegular(
                context,
                fontSize: 30.sp,
                fontFamily: TextStyles.bebasNeue,
              ),
            ),
          ),
          Visibility(
            visible: hasAction,
            child: Positioned(
              right: 20,
              child: IconButton(
                onPressed: hasActionOnPressed,
                icon: isText ?
                Text(
                  icon,
                  style: const TextStyle(
                    color: Color(0xFF303841),
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ) : setPhoto(kind: 1, path: icon, height: 20, width: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
