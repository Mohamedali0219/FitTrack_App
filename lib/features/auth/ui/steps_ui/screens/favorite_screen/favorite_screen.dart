// Page 1: Favorite Selection Screen
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import 'custom_grid.dart';

class BuildFavoriteScreen extends StatefulWidget {
  final VoidCallback onSubmit; 
  const BuildFavoriteScreen({super.key, required this.onSubmit});

  @override
  State<BuildFavoriteScreen> createState() => _BuildFavoriteScreenState();
}

class _BuildFavoriteScreenState extends State<BuildFavoriteScreen> {
  String selectedFavorite = "";
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
                    onTap: () => setState(() => selectedFavorite = 'Running')),
                CustomGridItem(
                  title: "Walking",
                  imageUrl: 'assets/images/Ellipse 207.png',
                  onTap: () => setState(() => selectedFavorite = 'Walking'),
                ),
                CustomGridItem(
                  title: "Meal Plan",
                  imageUrl: 'assets/images/Ellipse 208.png',
                  onTap: () => setState(() => selectedFavorite = 'Meal Plan'),
                ),
                CustomGridItem(
                  title: "Cycling",
                  imageUrl: 'assets/images/Ellipse 209.png',
                  onTap: () => setState(() => selectedFavorite = 'Cycling'),
                ),
                CustomGridItem(
                  title: "Yoga",
                  imageUrl: 'assets/images/Ellipse 210.png',
                  onTap: () => setState(() => selectedFavorite = 'Yoga'),
                ),
                CustomGridItem(
                  title: "Health",
                  imageUrl: 'assets/images/Ellipse 211.png',
                  onTap: () => setState(() => selectedFavorite = 'Health'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          customButton(
              text: 'Next Step',
              onPressed: () {
                 UserModel.instance.setFavoriteActivity = selectedFavorite;
                 widget.onSubmit();
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
