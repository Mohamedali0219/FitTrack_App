import 'package:flutter/material.dart';

import '../../../core/themes/colors_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/widgets/custom_button.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "LETS GET STARTED",
                style: TextStyles.styleBold(
                  context,
                  fontSize: 25,
                  color: ColorsManager.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "The standard chunk of Lorem Ipsum \nused since the 1500s is reproduced below\nfor those interested.",
                style: TextStyles.styleRegular(
                  context,
                  fontSize: 13,
                  color: ColorsManager.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/Mask group.png',
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/Sculpt your ideal body, free your true self, transform your life..png',
              ),
              const Spacer(),
              defaultButton(
                  text: "GET STARTED!",
                  onPressed: () {},
                  fontSize: 18,
                  radius: 8.0),
              const SizedBox(height: 5),
            ],
          ),
        ));
  }
}
