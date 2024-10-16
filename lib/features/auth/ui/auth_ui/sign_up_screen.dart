import 'package:fit_track_app/core/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/colors_manager.dart';
import '../steps_ui/steps_screens.dart';
import 'login_screen.dart';
import '../widgets/custom_signin_with_google.dart';

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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please enter your credentials to \n proceed",
                    style: TextStyle(fontSize: 14, color: Colors.grey[850]),
                  ),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                      controller: fullNameController,
                      label: "Full Name",
                      radius: 8.0,
                      hintText: "John doe",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    label: "Phone",
                    hintText: "0123456789",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: const Icon (Icons.check),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    label: "Email",
                    hintText: "example@gmail.com",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: const Icon(Icons.visibility_outlined),
                    controller: passwordController,
                    label: "Password",
                    hintText: "********",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const OnboardingScreens(),
                        ),
                      );
                    },
                    text: "Create Account",
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      "OR Register with",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CustomGoogleButton(),
                  const SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: ColorsManager.primaryColor,
                            ),
                          ),
                        ),
                      ],
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
