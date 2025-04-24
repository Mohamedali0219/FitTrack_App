import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

late TimeOfDay time ;
late String interval;
String globalTime = '${time.hour}:${time.minute} $interval';

class ReminderTimeWidget extends StatefulWidget {
  const ReminderTimeWidget({super.key});

  @override
  State<ReminderTimeWidget> createState() => _ReminderTimeWidgetState();
}

class _ReminderTimeWidgetState extends State<ReminderTimeWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String dayInterval = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.timer_outlined,
              size: 15,
              color: ColorsManager.blackColor,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Time',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        defaultButton(
          onPressed: () async {
            final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              initialEntryMode: TimePickerEntryMode.input,
            );
            if (timeOfDay != null) {
              setState(() {
                selectedTime = timeOfDay;
                time = selectedTime;
              });
            }
            if (selectedTime.hour > 12) {
              setState(() {
                dayInterval = 'PM';
                interval = dayInterval;
              });
            } else {
              setState(() {
                dayInterval = 'AM';
                interval = dayInterval;
              });
            }
          },
          text: '${selectedTime.hour}:${selectedTime.minute}  $dayInterval  ▾',
          fontSize: 14,
          height: 38,
          width: 120,
          radius: 8,
          background: Colors.grey[200] ?? const Color(0xFF696969),
          textColor: ColorsManager.textBaseColor,
        ),
      ],
    );
  }
}
