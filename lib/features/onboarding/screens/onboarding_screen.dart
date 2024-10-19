import 'package:fit_track_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import '../../../core/themes/colors_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../auth/ui/auth_ui/login/login_screen.dart';
import '../widget/onboarding_view_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;
 List <OnBoardingModel> boarding = [
  OnBoardingModel(image: 'assets/images/image3.png', body: "assets/images/Prefect body Text.png"),
  OnBoardingModel(image: 'assets/images/image4.png', body: "assets/images/Shot Strong Text.png"),
 ];
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemCount: boarding.length,
                itemBuilder: (context, index) {
                   return OnBoardingBody(
                 image: boarding[index].image,
                  body: boarding[index].body,
                );
               },
              ),
            ),
           const SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the buttons and indicator
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                       Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
              
                    },
                    child: Text(
                      "Skip",
                     style: TextStyles.styleSemiBold(
                          context,
                          fontSize: 20.sp,
                          color: ColorsManager.blackColor
                        ),
                    ),
                  ),
                  // Page indicator
                  SmoothPageIndicator(
                    controller: boardingController,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: ColorsManager.primaryColor,
                      dotColor:  ColorsManager.blackColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                    count: boarding.length,
                  ),
                  // Next button
                  TextButton(
                    onPressed: () {
                      if (boardingController.page == boarding.length - 1) {
                         Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
              
                      } else {
                        boardingController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyles.styleSemiBold(
                          context,
                          fontSize: 20.sp,
                          color: ColorsManager.blackColor
                        ),
                      
                    ),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
