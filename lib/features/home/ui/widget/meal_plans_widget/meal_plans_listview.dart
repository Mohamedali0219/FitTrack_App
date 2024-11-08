import 'package:fit_track_app/features/home/ui/widget/meal_plans_widget/meal_plans_items.dart';
import 'package:fit_track_app/features/meals/logic/cubit/get_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealPlansListview extends StatefulWidget {
  const MealPlansListview({super.key});

  @override
  State<MealPlansListview> createState() => _MealPlansListviewState();
}

class _MealPlansListviewState extends State<MealPlansListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMealsCubit, GetMealsState>(
      builder: (context, state) {
        if (state is GetMealsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is GetMealsSuccess){
          return SizedBox(
            height: 260 * 1.9, // Adjust height as needed
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: MealPlansItems(meal: state.meals[index],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Divider(
                    color: Color(0xFF696969),
                    thickness: 0,
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
