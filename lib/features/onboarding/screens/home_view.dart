import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpg'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/image2.png',
            width: 500,
            height: 500,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/Pro Fitness Text.png',
            width: 210,
            height: 113,
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen(),
                ),
              );
            },
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            minWidth: 200,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Let's Start",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
