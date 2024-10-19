import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/themes/colors_manager.dart';

import '../login/login_screen.dart';
import '../../widgets/custom_signin_with_google.dart';
import 'package:toastification/toastification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    String? email;
    String? password;
    String? fullName;
    String? phone;

    bool showPassword = false;
    // void togglePasswordView() {
    //   setState(() {
    //     isHiddenPassword = !isHiddenPassword;
    //   });
    // }



    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(children: [
              Column(
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
                      onChange: (value) => fullName = value,
                      controller: fullNameController,
                      label: "Full Name",
                      radius: 8.0,
                      hintText: "John doe",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                    onChange: (value) => phone = value,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    label: "Phone",
                    hintText: "0123456789",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 5),
                  defaultTextFormField(
                    onChange: (value) => email = value,
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: const Icon(Icons.check),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    label: "Email",
                    hintText: "example@gmail.com",
                    radius: 8.0,
                  ),
                  const SizedBox(height: 5),
                  buildPasswordField(
                      onChange: (value) => password = value,
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      showPassword: showPassword,
                      controller: passwordController,
                      radius: 8.0,
                      changePasswordVisibility: () =>
                          setState(() => showPassword = !showPassword)),
                  const SizedBox(height: 10),
                  customButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        try {
                          await registerUser(email, password);
                          showToast(context, "successfully created account",
                              ToastificationType.success);

                          if (FirebaseAuth
                              .instance.currentUser!.emailVerified) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          } else {
                            showToast(context, 'Something verify your email',
                                ToastificationType.error);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showToast(
                                context,
                                'The password provided is too weak.',
                                ToastificationType.error);
                          } else if (e.code == 'email-already-in-use') {
                            showToast(context, "'Email already in use.'",
                                ToastificationType.error);
                          } else if (e.code == 'invalid-email') {
                            showToast(context, 'The email address is invalid.',
                                ToastificationType.error);
                          } 
                          // else {
                          //   showToast(
                          //       context,
                          //       'Something went wrong , please try again.',
                          //       ToastificationType.error);
                          // }
                        }
                      }
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
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser(String? email, String? password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }
}

void showToast(BuildContext context, String text, ToastificationType type) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 3),
    type: type,
    borderRadius: BorderRadius.circular(15),
    style: ToastificationStyle.minimal,
    primaryColor: ColorsManager.primaryColor,
  );
}
