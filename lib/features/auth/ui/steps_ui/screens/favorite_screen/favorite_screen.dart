// Page 1: Favorite Selection Screen
import 'package:flutter/material.dart';

import 'custom_grid.dart';

class BuildFavoriteScreen extends StatelessWidget {
  const BuildFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Step 1 of 7"),
          const Text(
            "SELECT YOUR FAVORITE",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                CustomGridItem(
                  title: "Running",
                  imageUrl:
                      'assets/images/Ellipse 212.png', // Example image path
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Walking",
                  imageUrl: 'assets/images/Ellipse 207.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Meal Plan",
                  imageUrl: 'assets/images/Ellipse 208.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Cycling",
                  imageUrl: 'assets/images/Ellipse 209.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Yoga",
                  imageUrl: 'assets/images/Ellipse 210.png',
                  onTap: () {},
                ),
                CustomGridItem(
                  title: "Health",
                  imageUrl: 'assets/images/Ellipse 211.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}