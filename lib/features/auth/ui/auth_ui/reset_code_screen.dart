import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_otp.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Verify Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Verify your account by entering the verification code we sent to your email @gmail.com",
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OTPInput(controller: _otpController1, autoFocus: true),
                OTPInput(controller: _otpController2),
                OTPInput(controller: _otpController3),
                OTPInput(controller: _otpController4),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  // Resend OTP logic
                },
                child: const Text(
                  "Resend",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorsManager.primaryColor),
                ),
              ),
            ),
            const Spacer(),
            customButton(onPressed: () {}, text: "RESET PASSWORD"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
