
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';

class SwitchBtnWidget extends StatefulWidget {
  const SwitchBtnWidget({super.key});

  @override
  State<SwitchBtnWidget> createState() => _SwitchBtnWidgetState();
}

class _SwitchBtnWidgetState extends State<SwitchBtnWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _lights,
      inactiveThumbColor: ColorsManager.whiteColor,
      inactiveTrackColor: const Color(0xFF9D9D9D),
      thumbColor: const WidgetStatePropertyAll(ColorsManager.whiteColor,),
      activeColor:ColorsManager.primaryColor,
      trackOutlineColor: const WidgetStatePropertyAll(Color(0xFF9D9D9D),),
      activeTrackColor: ColorsManager.primaryColor,
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      onChanged: (bool value) {
        setState(() {
        _lights = value;
      });
      },
    );
  }
}
