import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/auth/ui/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/colors_manager.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/app_icons.dart';
import '../../core/widgets/custom_textformfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController whightController = TextEditingController();
    TextEditingController hightController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 16),
          onPressed: () {
            Navigator.pop(context);
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
                radius: 16,
                controller: fullNameController,
                label: 'Full Name',
                suffixIcon: const Icon(Icons.check),
                hintText: "John Doe",
              ),
              const SizedBox(height: 10),
              defaultTextFormField(
                controller: phoneNumberController,
                radius: 16,
                label: 'Phone',
                hintText: "01234567890",
              ),
              const SizedBox(height: 10),
              defaultTextFormField(
                controller: emailController,
                radius: 8.0,
                label: 'Email Address',
                hintText: "example@gmail.com",
              ),
              const SizedBox(height: 10),
              defaultTextFormField(
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
                controller: ageController,
                radius: 16,
                label: 'Age',
                hintText: "20",
              ),
              const SizedBox(height: 10),
              defaultButton(
                  onPressed: () {}, text: "Save", fontSize: 20, radius: 8),
            ],
          ),
        ),
      ),
    );
  }
}
