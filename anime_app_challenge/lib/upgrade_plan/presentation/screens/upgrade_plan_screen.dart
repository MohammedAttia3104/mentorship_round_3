import 'package:anime_app_challenge/core/theming/app_assets.dart';
import 'package:anime_app_challenge/core/theming/app_strings.dart';
import 'package:anime_app_challenge/core/theming/app_styles.dart';
import 'package:anime_app_challenge/core/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/upgrade_plan_bar.dart';
import '../widgets/upgrade_plan_subscription.dart';

class UpgradePlanScreen extends StatelessWidget {
  const UpgradePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffD3D6FF), Color(0xffFFFFFF)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [_buildBackgroundStars(), _buildUpgradePlanBody()],
        ),
      ),
    );
  }

  SingleChildScrollView _buildUpgradePlanBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 67.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UpgradePlanBar(),
            10.verticalSpace,
            Image.asset(AppAssets.rocketImage, width: 207.w, height: 207.h),
            4.verticalSpace,
            Text(
              AppStrings.seamlessAnimeExperience,
              style: AppStyles.font24Bold,
              textAlign: TextAlign.center,
            ),
            Text(
              AppStrings.enjoyUnlimitedAnime,
              style: AppStyles.font14GrayMedium,
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,

            UpgradePlanSubscription(),

            38.verticalSpace,

            CustomRoundedButton(text: 'Continue', onPressed: () {}),

            38.verticalSpace,
          ],
        ),
      ),
    );
  }

  Stack _buildBackgroundStars() {
    return Stack(
      children: [
        Positioned(
          top: -107.07.h,
          left: -170.76.w,
          child: Transform.rotate(
            angle: 72.01 * 3.14 / 180,
            child: SvgPicture.asset(
              AppAssets.starSvg,
              colorFilter: const ColorFilter.mode(
                Color(0xffD3D6FF),
                BlendMode.srcIn,
              ),
              height: 389.h,
              width: 389.w,
            ),
          ),
        ),
        Positioned(
          top: 231.h,
          right: -149.w,
          child: Transform.rotate(
            angle: 81.74 * 3.14 / 180,
            child: SvgPicture.asset(
              AppAssets.smallStarSvg,
              colorFilter: const ColorFilter.mode(
                Color(0xffD3D6FF),
                BlendMode.srcIn,
              ),
              height: 289.h,
              width: 289.w,
            ),
          ),
        ),
      ],
    );
  }
}
