import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/app_settings/ui/widget/switch_btn_widget/switch_btn_widget.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_date_widget/reminder_date_widget.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_time_widget/reminder_time_widget.dart';
import 'package:flutter/material.dart';

void buildShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: ColorsManager.whiteColor,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Schedule Exercise',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 22,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: ColorsManager.blackColor,
                    size: 20,
                  ),
                ),
              ],
            ),
            const ReminderDateWidget(),
            const SizedBox(
              height: 15.0,
            ),
            const ReminderTimeWidget(),
            const SizedBox(
              height: 15.0,
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.notifications_none_outlined,
                size: 15,
                color: ColorsManager.blackColor,
              ),
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
                onPressed: () {},
                background: ColorsManager.primaryColor,
                text: 'Done',
                fontSize: 22,
                radius: 8),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
    },
  );
}
