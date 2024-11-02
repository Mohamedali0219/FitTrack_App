import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/favorite_btn/ui/favorite_btn_widget/favorite_btn_widget.dart';
import 'package:flutter/material.dart';

class PopularExerciseItems extends StatefulWidget {
  const PopularExerciseItems({super.key, required this.popularExercise});

  final Map<String, dynamic> popularExercise;

  @override
  State<PopularExerciseItems> createState() => _PopularExerciseItemsState();
}

class _PopularExerciseItemsState extends State<PopularExerciseItems> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 300,
                height: 155,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.popularExercise['imageUrl'],
                    ),
                  ),
                  shape: const ContinuousRectangleBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                ),
                child: FavoriteBtnWidget(
                  isLocked: false,
                  itemId: widget.popularExercise['uid'].toString(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.popularExercise['name'],
            style: const TextStyle(
              color: ColorsManager.textBaseColor,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.popularExercise['description'],
                style: const TextStyle(
                  color: Color(0xFF303841),
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Container(
                height: 8,
                width: 1,
                color: const Color(0xFF707070),
              ),
              const SizedBox(
                width: 11,
              ),
              const Icon(
                Icons.timer_outlined,
                color: Color(0xFF00ADB5),
                size: 10,
              ),
              const SizedBox(
                width: 6,
              ),
               Text(
                widget.popularExercise['time'],
                style: const TextStyle(
                  color: ColorsManager.textSecondaryColor,
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
