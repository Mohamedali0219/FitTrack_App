import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manager.dart';

class OTPInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OTPInput({super.key, required this.controller, this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsManager.primaryColor),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context)
                .nextFocus(); // Move focus to next input field
          }
        },
      ),
    );
  }
}
