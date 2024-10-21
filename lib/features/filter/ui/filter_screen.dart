import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/filter/ui/widget/filter_btn_widget/filter_btn_widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isSelected7 = false;
  bool isSelected8 = false;
  bool isSelected9 = false;

  bool isSelected11 = false;
  bool isSelected12 = false;
  bool isSelected13 = false;
  bool isSelected14 = false;
  bool isSelected15 = false;
  bool isSelected16 = false;

  bool isSelected17 = false;
  bool isSelected18 = false;
  bool isSelected19 = false;

  bool isSelected21 = false;
  bool isSelected22 = false;
  bool isSelected23 = false;

  bool isSelected24 = false;
  bool isSelected25 = false;
  bool isSelected26 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Filters Plan',
        isback: true,
        onPressed: () => context.pop(),
        isText: true,
        hasAction: true,
        icon: 'Clear All',
        hasActionOnPressed: () {
          setState(() {
            isSelected1 = false;
            isSelected2 = false;
            isSelected3 = false;
            isSelected4 = false;
            isSelected5 = false;
            isSelected6 = false;
            isSelected7 = false;
            isSelected8 = false;
            isSelected9 = false;

            isSelected11 = false;
            isSelected12 = false;
            isSelected13 = false;
            isSelected14 = false;
            isSelected15 = false;
            isSelected16 = false;

            isSelected17 = false;
            isSelected18 = false;
            isSelected19 = false;

            isSelected21 = false;
            isSelected22 = false;
            isSelected23 = false;

            isSelected24 = false;
            isSelected25 = false;
            isSelected26 = false;
          });
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CATEGORIES',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'All',
                    isSelected: isSelected1,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Cardio',
                    isSelected: isSelected2,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected3 = !isSelected3;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Warm-Up',
                    isSelected: isSelected3,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected4 = !isSelected4;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Yoga',
                    isSelected: isSelected4,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected5 = !isSelected5;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Running',
                    isSelected: isSelected5,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected6 = !isSelected6;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Stretching',
                    isSelected: isSelected6,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected7 = !isSelected7;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Stretch',
                    isSelected: isSelected7,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected8 = !isSelected8;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Arms',
                    isSelected: isSelected8,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected9 = !isSelected9;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Boxing',
                    isSelected: isSelected9,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'EXERCISE',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected11 = !isSelected11;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'All',
                    isSelected: isSelected11,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected12 = !isSelected12;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Biceps',
                    isSelected: isSelected12,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected13 = !isSelected13;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Back',
                    isSelected: isSelected13,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected14 = !isSelected14;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Shoulders',
                    isSelected: isSelected14,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected15 = !isSelected15;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Triceps',
                    isSelected: isSelected15,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected16 = !isSelected16;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Legs',
                    isSelected: isSelected16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'LEVEL',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected17 = !isSelected17;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Beginner',
                    isSelected: isSelected17,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected18 = !isSelected18;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Average',
                    isSelected: isSelected18,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected19 = !isSelected19;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Hard',
                    isSelected: isSelected19,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'MEAL',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected21 = !isSelected21;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Breakfast',
                    isSelected: isSelected21,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected22 = !isSelected22;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Lunch',
                    isSelected: isSelected22,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected23 = !isSelected23;
                    });
                  },
                  child: FilterBtnWidget(
                    label: 'Dinner',
                    isSelected: isSelected23,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'TIME',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected24 = !isSelected24;
                    });
                  },
                  child: FilterBtnWidget(
                    label: '10-15 Min',
                    isSelected: isSelected24,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected25 = !isSelected25;
                    });
                  },
                  child: FilterBtnWidget(
                    label: '15-30 Min',
                    isSelected: isSelected25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected26 = !isSelected26;
                    });
                  },
                  child: FilterBtnWidget(
                    label: '30-45 Min',
                    isSelected: isSelected26,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              onPressed: () {},
              text: 'Apply Filters',
              fontSize: 22,
              radius: 8.0,
              background: ColorsManager.primaryColor,
              textColor: ColorsManager.whiteColor,
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
