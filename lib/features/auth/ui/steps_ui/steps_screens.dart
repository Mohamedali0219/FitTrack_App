import 'package:flutter/material.dart';
import 'screens/finish_screen/fihish_screen.dart';
import '../widgets/custom_header.dart';
import 'screens/age_screen/age_screen.dart';
import 'screens/favorite_screen/favorite_screen.dart';
import 'screens/fitness_level_screen/fitness_level_screen.dart';
import 'screens/goal_screen/goal_screen.dart';
import 'screens/height_screen/height_screen.dart';
import 'screens/weight_goal_screen/weight_goal_screen.dart';
import 'screens/weight_screen/weight_screen.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  bool isLast = false;
  int page = 0;
  // final List<Widget> pages = const [
  //   // Page 1: Select your favorite
  //   BuildFavoriteScreen(),
  //   // Page 2: How old are you?
  //   BuildAgeScreen(),
  //   // Page 3: How much do you weigh?
  //   BuildWeightScreen(),
  //   // Page 4: What is your goal weight?
  //   BuildGoalWeightScreen(),
  //   // Page 5: How tall are you?
  //   BuildHeightScreen(),
  //   // Page 6: What is your fitness level?
  //   BuildFitnessLevelScreen(),
  //   // Page 7: What is your goal?
  //   BuildGoalScreen(),
  // ];
  final PageController pageController = PageController();

  void _goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      this.page = page;
      isLast = page == 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenHeader(
              onSkip: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const FinishScreen(),
              )),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  BuildFavoriteScreen(
                    onSubmit: () => _goToPage(1),
                  ),
                  // Page 2: How old are you?
                  BuildAgeScreen(
                    onSubmit: () => _goToPage(2),
                  ),
                  // Page 3: How much do you weigh?
                  BuildWeightScreen(
                    onSubmit: () => _goToPage(3),
                  ),
                  // Page 4: What is your goal weight?
                  BuildGoalWeightScreen(
                    onSubmit: () => _goToPage(4),
                  ),
                  // Page 5: How tall are you?
                  BuildHeightScreen(
                    onSubmit: () => _goToPage(5),
                  ),
                  // Page 6: What is your fitness level?
                  BuildFitnessLevelScreen(
                    onSubmit: () => _goToPage(6),
                  ),
                  // Page 7: What is your goal?
                  BuildGoalScreen(
                    onSubmit: () => _goToPage(7),
                  ),
                ],
              ),
              // child: PageView.builder(
              //   controller: pageController,
              //   onPageChanged: (int index) {
              //     if (index == pages.length - 1) {
              //       setState(() {
              //         isLast = true;
              //       });
              //     } else {
              //       setState(() {
              //         isLast = false;
              //       });
              //     }
              //   },
              //   // physics: const BouncingScrollPhysics(),
              //   // itemBuilder: (context, index) {
              //   //   return pages[index];
              //   // },
              //   itemCount: pages.length,
              // ),
            ),
            // customButton(
            //     text: isLast ? "FINISH STEPS" : " NEXT STEPS",
            //     onPressed: () {
            //       if (isLast == true) {
            //         Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //             builder: (context) => const FinishScreen(),
            //           ),
            //         );
            //       } else {
            //         // pageController.nextPage(
            //         //     duration: const Duration(milliseconds: 300),
            //         //     curve: Curves.easeIn);
            //         _goToPage(page + 1);
            //       }
            //     }),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
