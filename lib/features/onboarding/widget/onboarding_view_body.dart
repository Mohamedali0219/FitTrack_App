import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.image , required this.body});
  final String image; 
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
                  image,
              ),
        ),
             const SizedBox(height: 20),
           Image.asset(
                body,
            ),
             const SizedBox(height: 30),
      ],
    );
  }
}