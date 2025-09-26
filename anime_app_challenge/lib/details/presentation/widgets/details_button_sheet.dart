import 'package:anime_app_challenge/core/theming/app_assets.dart';
import 'package:anime_app_challenge/core/theming/app_styles.dart';
import 'package:anime_app_challenge/upgrade_plan/presentation/screens/upgrade_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_colors.dart';

class DetailsButtonSheet extends StatelessWidget {
  const DetailsButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 0,
      enableDrag: false,
      onClosing: () {},
      builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.11,
          color: const Color(0xff16103C),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            spacing: 16.w,
            children: [
              _buildSelectedButton(
                iconPath: AppAssets.previewSvgIcon,
                text: "Preview",
                isPrimary: false,
              ),
              _buildSelectedButton(
                iconPath: AppAssets.eyeSvgIcon,
                text: 'Watch Now',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpgradePlanScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectedButton({
    required String iconPath,
    required String text,
    bool isPrimary = true,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36).r,
            color: isPrimary
                ? AppColors.primaryColor
                : const Color(0xff8D8998).withValues(alpha: 0.40),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.w,
            children: [
              SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
              Text(text, style: AppStyles.font16WhiteBold),
            ],
          ),
        ),
      ),
    );
  }
}
