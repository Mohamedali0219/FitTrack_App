
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/drawer/ui/home_layout.dart';
import 'package:fit_track_app/features/profile/widgets/goal_type_widget/goal_type_listview.dart';
import 'package:fit_track_app/features/profile/widgets/info_row/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/themes/colors_manager.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/app_icons.dart';
import 'edit_profile_screen.dart';
import 'widgets/macronutrient_goals/macronutrient_goal.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user= UserModel.instance;
    // print(user.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 16),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeLayout(),
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
          'Profile',
          style: TextStyles.styleBold(
            context,
            fontSize: 24,
            color: ColorsManager.blackColor,
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              AppIcons.editIcon,
              colorFilter: const ColorFilter.mode(
                ColorsManager.blackColor,
                BlendMode.srcIn,
              ),
              width: 20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/images/person.png',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
                    child: Text(
                      user.getFullName ?? '',
                      style: TextStyles.styleSemiBold(context,
                          fontSize: 16, color: ColorsManager.textBaseColor),
                    ),
                  ),
            Center(
                    child: Text(
                      user.getPhone?? '',
                      style: TextStyles.styleSemiBold(context,
                          fontSize: 16, color: ColorsManager.textBaseColor),
                    ),
                  ),
            const SizedBox(height: 10),
            const InfoRow(),
            const SizedBox(height: 20),
            Text(
              'Goal',
              textAlign: TextAlign.start,
              style: TextStyles.styleBold(
                context,
                fontSize: 22,
                color: ColorsManager.textBaseColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoryTypeListview(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Macronutrients',
              textAlign: TextAlign.start,
              style: TextStyles.styleBold(
                context,
                fontSize: 22,
                color: ColorsManager.textBaseColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MacronutrientGoals(),
          ],
        ),
      ),
    );
  }
}
