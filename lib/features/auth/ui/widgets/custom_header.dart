import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final VoidCallback onSkip;

  const ScreenHeader({
    required this.onSkip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        TextButton(
            onPressed: onSkip,
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
