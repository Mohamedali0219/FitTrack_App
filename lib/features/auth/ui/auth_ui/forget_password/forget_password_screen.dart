import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/features/auth/ui/auth_ui/login/login_screen.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? email;
    return Form(
      key: formKey,
      child: Scaffold(
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
                onChange: (value) => email = value,
                onFieldSubmitted: (value) => email = value,
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
                onPressed: () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email!);
                      showToast(
                          // ignore: use_build_context_synchronously
                          context,
                          " Please check your email for reset password",
                          ToastificationType.success);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  } on Exception catch (e) {
                    // ignore: use_build_context_synchronously
                    showToast(context, e.toString(), ToastificationType.error);
                  }
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OTPScreen(),
                  //   ),
                  // );
                },
                text: 'RESET PASSWORD',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
