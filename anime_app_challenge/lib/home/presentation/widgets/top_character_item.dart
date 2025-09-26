import 'package:anime_app_challenge/home/domain/entities/anime_character_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/theming/font_weight_helper.dart';

class TopCharacterItem extends StatelessWidget {
  final AnimeCharacterEntity character;

  const TopCharacterItem(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 92.w,
          height: 92.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(character.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        10.verticalSpace,
        Text(character.name, style: AppStyles.font16SemiBold),
        6.verticalSpace,
        Text(
          character.topMovie,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.lightGrayColor,
          ),
        ),
      ],
    );
  }
}
