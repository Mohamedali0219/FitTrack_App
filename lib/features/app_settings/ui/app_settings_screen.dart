import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/app_settings/ui/widget/settings_app_items/settings_app_items.dart';
import 'package:fit_track_app/features/app_settings/ui/widget/switch_btn_widget/switch_btn_widget.dart';
import 'package:fit_track_app/features/drawer/ui/home_layout.dart';
import 'package:fit_track_app/features/reminder/ui/reminder_screen.dart';
import 'package:flutter/material.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'App Setting',
        isback: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              SettingsAppItems(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReminderScreen(),
                    ),
                  );
                },
                icon: Icons.notifications_none,
                title: 'Reminder',
                training: const SizedBox(),
              ),
              const SettingsAppItems(
                icon: Icons.lock_open,
                title: 'Change Password',
                training: SizedBox(),
              ),
              const SettingsAppItems(
                icon: Icons.favorite_outline,
                title: 'Apple Health',
                training: SwitchBtnWidget(),
              ),
              const SettingsAppItems(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                training: SwitchBtnWidget(),
              ),
              const SettingsAppItems(
                icon: Icons.language_outlined,
                title: 'Language',
                training: Text('English'),
              ),
              const Spacer(),
              defaultButton(
                  onPressed: () {},
                  background: ColorsManager.primaryColor,
                  text: 'Upgrade premium',
                  fontSize: 22,
                  radius: 8),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Version 1.0',
                style: TextStyle(
                  color: Color(0xFF3A4750),
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
