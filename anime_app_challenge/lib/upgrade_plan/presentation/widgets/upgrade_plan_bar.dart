import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_strings.dart';
import '../../../core/theming/app_styles.dart';

class UpgradePlanBar extends StatelessWidget {
  const UpgradePlanBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            AppStrings.upgradeYourPlan,
            textAlign: TextAlign.center,
            style: AppStyles.font24Bold.copyWith(
              fontSize: 22.sp,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: EdgeInsetsDirectional.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
