import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
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
    double position = (DateTime.now().day - 1) * (80 + 16);
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: ColorsManager.textBaseColor,
                ),
                onPressed: () {
                  setState(() {
                    currentMonth =
                        DateTime(currentMonth.year, currentMonth.month - 1);
                  });
                },
              ),
              Column(
                children: [
                  Text(
                    DateFormat.MMMM().format(currentMonth),
                    style: TextStyles.styleBold(
                      context,
                      fontSize: 22.sp,
                      color: ColorsManager.textBaseColor,
                    ),
                  ),
                  Text(
                    DateFormat.y().format(currentMonth),
                    style: TextStyles.styleRegular(
                      context,
                      fontSize: 18.sp,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
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
                  });
                },
                child: Container(
                  width: 80,
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
                          fontSize: 16.sp,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Show CircleAvatar only if it's today
                      if (isToday)
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: !isSelected
                                ? Colors.transparent
                                : ColorsManager.whiteColor,
                            child: Text(
                              date.day.toString(),
                              style: TextStyles.styleSemiBold(
                                context,
                                fontSize: 16.sp,
                                color: ColorsManager.blackColor,
                              ),
                            ))
                      else
                        // No circle for selected days, just white text
                        Text(
                          date.day.toString(),
                          style: TextStyles.styleSemiBold(
                            context,
                            fontSize: 16.sp,
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
