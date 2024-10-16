import 'package:fit_track_app/features/profile/widgets/info_row/info_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_icons.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InfoRowItem(firstText: " 55 kg", secondText: " Weight"),
          const SizedBox(width: 10),
          SvgPicture.asset(
            AppIcons.lineIcon,
            colorFilter: ColorFilter.mode(
              Colors.grey[300]!,
              BlendMode.srcIn,
            ),
            width: 3,
          ),
          const SizedBox(width: 10),
          const InfoRowItem(firstText: " 175 cm", secondText: " Height"),
          const SizedBox(width: 10),
          SvgPicture.asset(
            AppIcons.lineIcon,
            colorFilter: ColorFilter.mode(
              Colors.grey[300]!,
              BlendMode.srcIn,
            ),
            width: 3,
          ),
          const SizedBox(width: 10),
          const InfoRowItem(firstText: " 25 year", secondText: " Age "),
        ],
      ),
    );
  }
}