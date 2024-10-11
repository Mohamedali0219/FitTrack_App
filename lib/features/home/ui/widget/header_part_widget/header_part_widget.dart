import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';

class HeaderPartWidget extends StatelessWidget {
  const HeaderPartWidget({super.key, required this.onPressed, required this.title, this.hasSeeAll = true});
  final String title;
  final void Function()? onPressed;
  final bool hasSeeAll ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorsManager.textBaseColor,
            fontSize: 18,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: hasSeeAll ? const Text(
            'See all',
            style: TextStyle(
              color: Color(0xFF191919),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ) : const SizedBox(),
        ) ,
      ],
    );
  }
}
