import 'package:fit_track_app/core/helper/database/database_helper.dart';
import 'package:fit_track_app/core/service/reminder/notification_helper.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/app_settings/ui/widget/switch_btn_widget/switch_btn_widget.dart';
import 'package:fit_track_app/features/reminder/ui/reminder_listview_screen.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_date_widget/reminder_date_widget.dart';
import 'package:fit_track_app/features/reminder/ui/widget/reminder_time_widget/reminder_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class FunctionReminderScreen extends StatefulWidget {
  final int? reminderId;

  const FunctionReminderScreen({super.key, this.reminderId});

  @override
  State<FunctionReminderScreen> createState() => _FunctionReminderScreenState();
}

class _FunctionReminderScreenState extends State<FunctionReminderScreen> {
  String _title = 'make reminder now';
  String _category = 'Exercise';
  DateTime _reminderTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.reminderId != null) {
      fetchReminder();
    }
  }

  Future<void> fetchReminder() async {
    try {
      final data = await DbHelper.getRemindersById(widget.reminderId!);
      if (data != null) {
        _category = data['category'];
        _reminderTime = DateTime.parse(data['reminderTime']);
      }
    } catch (e) {}
  }

  Future<void> _saveReminder() async{
    final newReminder = {
      'title':_title,
      'category':_category,
      'isActive': isOn,
      'reminderTime': _reminderTime.toIso8601String(),
    };
    if(widget.reminderId == null){
      final reminderId= await DbHelper.addReminder(newReminder);
      NotificationHelper.scheduleNotification(reminderId, _title, _category, _reminderTime);
    }else{
      await DbHelper.updateReminder(widget.reminderId!, newReminder);
      NotificationHelper.scheduleNotification(widget.reminderId!, _title, _category, _reminderTime);
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReminderScreen(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.reminderId == null ? 'Add Reminder' : 'Update Reminder',
          style: TextStyles.styleRegular(
            context,
            fontSize: 30.sp,
            fontFamily: TextStyles.bebasNeue,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReminderDateWidget(),
            const SizedBox(
              height: 40.0,
            ),
            const ReminderTimeWidget(),
            const SizedBox(
              height: 50.0,
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
                onPressed: _saveReminder,
                background: ColorsManager.primaryColor,
                text: 'Create',
                fontSize: 22,
                radius: 8),
          ],
        ),
      ),
    );
  }
}
