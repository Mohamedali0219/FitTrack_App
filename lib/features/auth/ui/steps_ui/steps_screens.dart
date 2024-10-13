import 'package:flutter/material.dart';
import '../fihish_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';
import 'steps_widgets.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
   bool isLast = false;
  final List<Widget> pages = const [
    // Page 1: Select your favorite
    BuildFavoriteScreen(),
    // Page 2: How old are you?
    BuildAgeScreen(),
    // Page 3: How much do you weigh?
    BuildWeightScreen(),
    // Page 4: What is your goal weight?
    BuildGoalWeightScreen(),
    // Page 5: How tall are you?
    BuildHeightScreen(),
    // Page 6: What is your fitness level?
    BuildFitnessLevelScreen(),
    // Page 7: What is your goal?
    BuildGoalScreen(),
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenHeader(
              onSkip: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (int index) {
                  if (index == pages.length - 1) {
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
                itemBuilder: (context, index) {
                  return pages[index];
                },
                itemCount: pages.length,
              ),
            ),
            customButton(
                text: isLast ? "FINISH STEPS" : " NEXT STEPS",
                onPressed: () {
                  if (isLast == true) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const FinishScreen(),
                      ),
                    );
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
