import 'package:flutter/material.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget(
      {super.key, this.isSelected = false, this.isLocked = false});

  final bool isSelected;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        shape: BoxShape.rectangle,
      ),
      child: isLocked
          ? const Icon(
              Icons.lock,
              size: 15,
              color: Colors.black,
            )
          : isSelected
              ? const Icon(
                  Icons.favorite,
                  size: 15,
                  color: Color(0xFFFF6079),
                )
              : const Icon(
                  Icons.favorite_outline,
                  size: 15,
                  color: Colors.black,
                ),
    );
  }
}
