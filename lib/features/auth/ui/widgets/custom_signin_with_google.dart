import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/utils/app_icons.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorsManager.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset(
              AppIcons.googleIcon,
              width: 30,
            ),
            const SizedBox(width: 40),
            const Text("Connect with Google",
                style: TextStyle(fontSize: 18, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
