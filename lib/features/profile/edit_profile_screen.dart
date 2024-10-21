import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/auth/ui/steps_ui/screens/weight_screen/custom_toggle_buttons.dart';
import 'package:fit_track_app/features/profile/profile_screen.dart';
import 'package:fit_track_app/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/colors_manager.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/app_icons.dart';
import '../auth/ui/widgets/custom_textformfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController whightController = TextEditingController();
    TextEditingController hightController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // String? fullName;
    // String? phoneNumber;
    // String? email;
    // double? whight;
    // double? hight;
    // int? age;
    // String? gender;

    Future<void> setUserData(
        String uid,
        String fullName,
        String phone,
        String email,
        int age,
        String weight,
        String height,
        String gender) async {
      try {
        // Create or update the user's document in Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).set(
            {
              'fullName': fullName,
              'phone': phone,
              'email': email,
              'age': age,
              'weight': weight,
              'height': height,
              'gender': gender,
            },
            SetOptions(
                merge:
                    true)); // merge: true ensures the document is updated if it exists

        print("User data successfully set.");
      } catch (e) {
        print("Failed to set user data: $e");
      }
    }

    var user = UserModel.instance;
    fullNameController.text = user.getFullName!;
    phoneNumberController.text = user.getPhone!;
    emailController.text = user.getEmail!;
    whightController.text = user.getWeight.toString();
    hightController.text = user.getHeight.toString();
    // genderController.text = user.getGender!;
    ageController.text = user.getAge.toString();
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            padding: const EdgeInsets.only(bottom: 16),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              AppIcons.arrowBackIcon,
              colorFilter: const ColorFilter.mode(
                  ColorsManager.textBaseColor, BlendMode.srcIn),
              width: 15,
            ),
          ),
          title: Center(
            child: Text(
              'Edit Profile',
              style: TextStyles.styleBold(
                context,
                fontSize: 24,
                color: ColorsManager.blackColor,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/profile-edit.png',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => fullName = value,
                  radius: 16,
                  controller: fullNameController,
                  label: 'Full Name',
                  suffixIcon: const Icon(Icons.check),
                  hintText: "John Doe",
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => phoneNumber = value,
                  controller: phoneNumberController,
                  radius: 16,
                  label: 'Phone',
                  hintText: "01234567890",
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => email = value,
                  controller: emailController,
                  radius: 8.0,
                  label: 'Email Address',
                  hintText: "example@gmail.com",
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => whight = double.parse(value),
                  controller: whightController,
                  radius: 16,
                  label: 'Wight',
                  hintText: "55",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomToggleButtons(
                        unit1: "kg", unit2: "lbs", onUnitChanged: (value) {}),
                  ),
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => hight = double.parse(value),
                  controller: hightController,
                  radius: 8.0,
                  label: 'Hight',
                  hintText: "175",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomToggleButtons(
                        unit1: "cm", unit2: "feet", onUnitChanged: (value) {}),
                  ),
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => gender = value,
                  controller: genderController,
                  radius: 16,
                  label: 'Gender',
                  hintText: "Male",
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  readOnly: true,
                  prefixIcon: Icons.male,
                ),
                const SizedBox(height: 10),
                defaultTextFormField(
                  // onFieldSubmitted: (value) => age = int.parse(value),
                  controller: ageController,
                  radius: 16,
                  label: 'Age',
                  hintText: "20",
                ),
                const SizedBox(height: 10),
                defaultButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String userID =
                            SharedPreference().getString(key: "user")!;
                        await setUserData(
                          userID,
                          fullNameController.text,
                          phoneNumberController.text,
                          emailController.text,
                          int.parse(ageController.text),
                          whightController.text,
                          hightController.text,
                          genderController.text,
                        );

                        setState(() {
                          user = UserModel.instance;
                          user.setNewUser(
                            id: userID,
                            email: emailController.text,
                            name: fullNameController.text,
                            phone: phoneNumberController.text,
                          );
                          user.setAge = int.parse(ageController.text);
                          user.setHeight = hightController.text;
                          user.setWeight = whightController.text;
                        });
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    text: "Save",
                    fontSize: 20,
                    radius: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
