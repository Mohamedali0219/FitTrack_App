import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/auth_ui/forget_password/forget_password_screen.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_signin_with_google.dart';
import 'package:fit_track_app/features/drawer/ui/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? email;
    String? password;
    bool isHiddenPassword = false;

    Future<void> loginUser() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
    }

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
                  const SizedBox(height: 30),
                  const Text(
                    "Welcome to Pro Fitness!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Hello there, sign in to \n continue!",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  defaultTextFormField(
                      onChange: (value) => email = value,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                      suffixIcon: const Icon(Icons.check),
                      hintText: "example@gmail.com",
                      controller: emailController,
                      label: "Email address",
                      radius: 8.0),
                  const SizedBox(height: 16),
                  defaultTextFormField(
                      onChange: (value) => password = value,
                      prefixIcon: Icons.lock,
                      suffixIcon: const Icon(Icons.visibility_outlined),
                      hintText: "********",
                      controller: passwordController,
                      label: "Password",
                      radius: 8.0,
                      obscureText: isHiddenPassword,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  customButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await loginUser();
                            showToast(context, "Login Successful",
                                ToastificationType.success);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeLayout(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showToast(
                                  context,
                                  "No user found for that email.",
                                  ToastificationType.error);
                            } else if (e.code == 'invalid-email') {
                              showToast(
                                  context,
                                  'The email address is invalid.',
                                  ToastificationType.error);
                            } else if (e.code == 'wrong-password') {
                              showToast(
                                  context,
                                  "Wrong password provided for that user.",
                                  ToastificationType.error);
                            }
                          }
                        }
                      },
                      text: "LOGIN"),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      "OR Login with",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomGoogleButton(),
                  const SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: ColorsManager.primaryColor),
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
