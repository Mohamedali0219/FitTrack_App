import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../drawer/ui/home_layout.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({super.key});

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) {
    //   return;
    // }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          signInWithGoogle().then((value) {
            print(value.user!.uid);
          }).catchError((error) {
            print(error);
          });
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorsManager.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset(
              AppIcons.googleIcon,
              width: 30,
            ),
            const SizedBox(width: 40),
            const Text("Connect with Google",
                style: TextStyle(fontSize: 18, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
