import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/subscription_plan_screen/ui/subscripition_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> buildAlertShow(BuildContext context) {
  return Alert(
    context: context,
    title: 'Subscribe to premium',
    closeIcon: const Icon(
      Icons.close,
      color: ColorsManager.textBaseColor,
      size: 20,
    ),
    buttons: [
      DialogButton(
        onPressed: () {
          context.pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SubscriptionPlanScreen(),
            ),
          );
        },
        color: ColorsManager.primaryColor,
        height: 55,
        width: 200,
        radius: BorderRadius.circular(16),
        child: const Text(
          'Unlock Premium',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
    closeFunction: () {
      context.pop();
    },
    image: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset(
          'assets/images/premium.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Running',
                style: TextStyle(
                  color: ColorsManager.textBaseColor,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Today\'s impossible is tomorrow\'s normal.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    content: const Text(
      'Enjoy unlimited access to our\npremium content ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF3A4750),
        fontSize: 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    ),
  ).show();
}
