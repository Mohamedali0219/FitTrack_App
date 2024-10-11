import 'package:fit_track_app/features/home/ui/widget/category_type_widget/category_type_items.dart';
import 'package:flutter/material.dart';

class CategoryTypeListview extends StatefulWidget {
  const CategoryTypeListview({super.key});

  @override
  State<CategoryTypeListview> createState() => _CategoryTypeListviewState();
}

class _CategoryTypeListviewState extends State<CategoryTypeListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> categoryTypesImages = [
      'assets/images/yoga.png',
      'assets/images/yoga.png',
      'assets/images/yoga.png',
      'assets/images/yoga.png',
      'assets/images/yoga.png',
    ];
    final List<String> categoryTypesName = [
      'Yoga',
      'Gym',
      'Cardio',
      'Stretch',
      'Full Body',
    ];
    return SizedBox(
      height: 110, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryTypesName.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CategoryTypeItems(
              isSelected: selectedIndex == index,
              categoryTypeImage: categoryTypesImages[index],
              categoryTypeName: categoryTypesName[index],
            )
          );
        },
      ),
    );
  }
}