import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/app_settings/ui/widget/switch_btn_widget/switch_btn_widget.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_date_widget/reminder_date_widget.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_time_widget/reminder_time_widget.dart';
import 'package:flutter/material.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reminder", isback: true, onPressed: () => context.pop(),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReminderDateWidget(),
            const SizedBox(height: 40.0,),
            const ReminderTimeWidget(),
            const SizedBox(height: 50.0,),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.notifications_none_outlined, size: 15, color: ColorsManager.blackColor,),
              title: Text('Set Reminder'),
              titleTextStyle: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              subtitle: Text('Reminder on'),
              subtitleTextStyle: TextStyle(
                color: Color(0xFF3A4750),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
              trailing: SwitchBtnWidget(),
            ),
            const Spacer(),
            defaultButton(
                onPressed: () {

                },
                background: ColorsManager.primaryColor,
                text: 'Create',
                fontSize: 22,
                radius: 8
            ),
          ],
        ),
      ),
    );
  }
}
