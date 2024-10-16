import 'package:fit_track_app/features/auth/ui/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/auth_ui/reset_code/reset_code_screen.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'FORGET PASSWORD',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please enter your email below to receive \n your password reset code.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            defaultTextFormField(
              controller: emailController,
              label: 'Email',
              radius: 8.0,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              suffixIcon: const Icon(Icons.check),
              hintText: 'example@gmail',
            ),
            const Spacer(),
            customButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OTPScreen(),
                  ),
                );
              },
              text: 'RESET PASSWORD',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
