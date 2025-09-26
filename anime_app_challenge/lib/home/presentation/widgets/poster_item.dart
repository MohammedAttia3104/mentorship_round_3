import 'package:anime_app_challenge/home/data/models/poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';

class PosterItem extends StatelessWidget {
  final Poster poster;

  const PosterItem({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 184.w,
          height: 245.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
              image: AssetImage(poster.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 12.h,
          right: 23.w,
          child: Container(
            width: 40.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.ratingStarSvg),
                4.horizontalSpace,
                Text(poster.rating.toString(), style: AppStyles.font12SemiBold),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
