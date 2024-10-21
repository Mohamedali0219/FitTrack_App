import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/ui/widgets/kcal_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: mealModel.id, //! i will change this to mealName
      child: Card(
        color: ColorsManager.whiteColor,
        child: Column(
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mealModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorsManager.blackColor.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mealModel.name.length > 25
                              ? '${mealModel.name.substring(0, 25)}...'
                              : mealModel.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.styleBold(
                            context,
                            fontSize: 15,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor:
                                ColorsManager.whiteColor.withOpacity(0.4),
                            child: const Icon(
                              size: 20,
                              Icons.favorite_border,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorsManager.blackColor.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealModel.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.styleBold(
                            context,
                            fontSize: 13,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            KcalAndClockSction(
              kcal: '${mealModel.calories} Kcal',
              clock: '15 min',
            )
          ],
        ),
      ),
    );
  }
}
