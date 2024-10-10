import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/meals/ui/widgets/custom_calender.dart';
import 'package:flutter/material.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meals PLans',
      ),
      body: const Center(
        child: CustomCalendar(),
      ),
    );
  }
}
