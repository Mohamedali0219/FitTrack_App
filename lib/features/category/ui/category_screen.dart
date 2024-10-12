import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/drawer/ui/home_layout.dart';
import 'package:fit_track_app/features/home/ui/widget/category_type_widget/category_type_items.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> categoryTypesImages = [
      'assets/images/yoga.png',
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
      'legs'
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Category',
        isback: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              constraints: const BoxConstraints(minHeight: 50.0),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Color(0xFF303841),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 20,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: categoryTypesName.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
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
        ],
      ),
    );
  }
}
