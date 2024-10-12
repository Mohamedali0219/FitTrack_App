import 'package:fit_track_app/core/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/themes/colors_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please enter your credentials to \n proceed",
                    style: TextStyle(fontSize: 16, color: Colors.grey[850]),
                  ),
                  const SizedBox(height: 24),
                  defaultTextFormField(
                      controller: fullNameController,
                      label: "Full Name",
                      radius: 8.0,
                      hintText: "John doe",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name),
                  const SizedBox(height: 16),
                  defaultTextFormField(
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    label: "Phone",
                    hintText: "0123456789",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 16),
                  defaultTextFormField(
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: Icons.check,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    label: "Email",
                    hintText: "example@gmail.com",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 16),
                  defaultTextFormField(
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: Icons.visibility_outlined,
                    controller: passwordController,
                    label: "Password",
                    hintText: "********",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            checkColor: Colors.white,
                            activeColor: ColorsManager.primaryColor,
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: ColorsManager.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // UserCredential user = await FirebaseAuth.instance
                        //     .createUserWithEmailAndPassword(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
