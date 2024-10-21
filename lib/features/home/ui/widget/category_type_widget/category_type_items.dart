import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryTypeItems extends StatelessWidget {
  const CategoryTypeItems({
    super.key,
    required this.categoryName,
  });

  final Map<String, dynamic> categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 61,
            height: 61,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  categoryName['imageUrl'],
                ),
              ),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryName['name'],
            style: TextStyles.styleBold(
              context,
              fontSize: 11,
              color: ColorsManager.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
