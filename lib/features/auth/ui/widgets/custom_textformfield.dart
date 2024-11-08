import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manager.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  final Function(String)? onFieldSubmitted,
  final Function(String)? onChange,
  String? Function(String?)? validator,
  final Function()? onTap,
  final Function()? onEditingComplete,
  final Function()? onSaved,
  final IconData? prefixIcon,
  final Widget? suffixIcon,
  final bool isPassword = false,
  final bool readOnly = false,
  final bool enabled = true,
  final String? hintText,
  double radius = 0.0,
  bool obscureText = false,
  keyboardType = TextInputType.text,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return " $label is required ";
            }
            return null;
          },
          controller: controller,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          onFieldSubmitted: (String value) {
            // print(value);
          },
          onChanged: onChange,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: ColorsManager
                      .primaryColor), // Set the focused border color
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );

Widget buildPasswordField({
  required String label,
  bool showPassword = false,
  required TextEditingController controller,
  required void Function()? changePasswordVisibility,
  final Function(String)? onFieldSubmitted,
  final Function(String)? onChange,
  String? Function(String?)? validator,
  final Function()? onTap,
  final Function()? onEditingComplete,
  final Function()? onSaved,
  final IconData? prefixIcon,
  final Widget? suffixIcon,
  final bool isPassword = false,
  final bool readOnly = false,
  final bool enabled = true,
  final String? hintText,
  double radius = 0.0,
  keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 5),
      TextFormField(
        obscureText: !showPassword,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return " $label is required ";
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (String value) {
          // print(value);
        },
        onChanged: onChange,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: IconButton(
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            onPressed: changePasswordVisibility,
          ),
          hintText: showPassword ? "Password " : "********",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color:
                    ColorsManager.primaryColor), // Set the focused border color
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    ],
  );
}
