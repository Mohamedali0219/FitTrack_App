import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_textformfield.dart';
import 'package:fit_track_app/features/auth/ui/auth_ui/forget_password/forget_password_screen.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_button.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_signin_with_google.dart';
import 'package:fit_track_app/features/drawer/ui/home_layout.dart';
import 'package:fit_track_app/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import '../../../functions.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
   
    String? email;
    String? password;
    bool showPassword = false;

    Future<void> loginUser() async {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      var user = UserModel.instance;
      user.setUserID = res.user!.uid;
    
      await SharedPreference().setString(key: "user", value:user.getUID!); 
      // print(UserModel.instance.toString());
      // print(  " user is  ${SharedPreference().getString(key: "user")}");
    }
  @override
  Widget build(BuildContext context) {
   
     GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                            // ignore: use_build_context_synchronously
                            showToast(context, "Login Successful",
                                ToastificationType.success);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeLayout(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showToast(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  "No user found for that email.",
                                  ToastificationType.error);
                            } else if (e.code == 'invalid-email') {
                              showToast(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  'The email address is invalid.',
                                  ToastificationType.error);
                            } else if (e.code == 'wrong-password') {
                              showToast(
                                  // ignore: use_build_context_synchronously
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
