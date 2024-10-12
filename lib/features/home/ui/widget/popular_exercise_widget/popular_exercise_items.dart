import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/favorite_btn/ui/favorite_btn_widget/favorite_btn_widget.dart';
import 'package:flutter/material.dart';

class PopularExerciseItems extends StatefulWidget {
  const PopularExerciseItems({super.key});

  @override
  State<PopularExerciseItems> createState() => _PopularExerciseItemsState();
}

class _PopularExerciseItemsState extends State<PopularExerciseItems> {
  bool isSelected = false;
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
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/exercise1.png'),
                  ),
                  shape: ContinuousRectangleBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                ),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: FavoriteBtnWidget(isSelected: isSelected,isLocked: false,),),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Full Shot Man Stretching Arm',
            style: TextStyle(
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
              const Text(
                'Beginner',
                style: TextStyle(
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
              const Text(
                '30 min',
                style: TextStyle(
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
