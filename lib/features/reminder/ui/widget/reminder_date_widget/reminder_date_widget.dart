import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

DateTime? globalMonth,globalDay;
String? globalDate = '${globalDay!.day.toString()} ${DateFormat.E().format(globalDay!)} ${DateFormat.MMMM().format(globalMonth!)} ${DateFormat.y().format(globalMonth!)}';
String? today = '${DateTime.now().day.toString()} ${DateFormat.E().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())}';

class ReminderDateWidget extends StatefulWidget {
  const ReminderDateWidget({super.key});

  @override
  ReminderDateWidgetState createState() => ReminderDateWidgetState();
}

class ReminderDateWidgetState extends State<ReminderDateWidget> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToToday();
    });
  }

  void scrollToToday() {
    double position = (DateTime.now().day - 1) * (50 + 16);
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Calendar Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 15,
                  color: ColorsManager.blackColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                    color: ColorsManager.textBaseColor,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 10,
                      color: ColorsManager.textBaseColor,
                    ),
                    onPressed: () {
                      setState(() {
                        currentMonth =
                            DateTime(currentMonth.year, currentMonth.month - 1);
                        globalMonth = currentMonth;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        DateFormat.MMMM().format(currentMonth),
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 14.sp,
                          color: ColorsManager.textBaseColor,
                        ),
                      ),
                      Text(
                        DateFormat.y().format(currentMonth),
                        style: TextStyles.styleRegular(
                          context,
                          fontSize: 14.sp,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: ColorsManager.textBaseColor,
                    ),
                    onPressed: () {
                      setState(() {
                        currentMonth =
                            DateTime(currentMonth.year, currentMonth.month + 1);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        // Calendar Days
        SizedBox(
          height: 120,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: DateTime(currentMonth.year, currentMonth.month + 1, 0)
                .day, // Get the number of days in the current month
            itemBuilder: (context, index) {
              DateTime date =
                  DateTime(currentMonth.year, currentMonth.month, index + 1);
              bool isSelected = date.day == selectedDate.day &&
                  date.month == selectedDate.month &&
                  date.year == selectedDate.year;
              bool isToday = date.day == DateTime.now().day &&
                  date.month == DateTime.now().month &&
                  date.year == DateTime.now().year;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                    globalDay=selectedDate;
                  });
                },
                child: Container(
                  width: 50,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.E().format(date),
                        style: TextStyles.styleSemiBold(
                          context,
                          fontSize: 14.sp,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Show CircleAvatar only if it's today
                      if (isToday)
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: !isSelected
                              ? Colors.transparent
                              : ColorsManager.whiteColor,
                          child: Text(
                            date.day.toString(),
                            style: TextStyles.styleSemiBold(
                              context,
                              fontSize: 14.sp,
                              color: ColorsManager.blackColor,
                            ),
                          ),
                        )
                      else
                        // No circle for selected days, just white text
                        Text(
                          date.day.toString(),
                          style: TextStyles.styleSemiBold(
                            context,
                            fontSize: 14.sp,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
