import 'package:anime_app_challenge/core/theming/app_assets.dart';
import 'package:anime_app_challenge/core/theming/app_strings.dart';
import 'package:anime_app_challenge/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/app_colors.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/home_characters_list_view.dart';
import '../widgets/home_chips.dart';
import '../widgets/home_posters_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.homeGradientStart, AppColors.whiteColor],
              stops: [0.0, 1.0],
            ),
          ),
          child: Stack(
            children: [
              ///Todo : Refactor
              ///To be like the original
              Positioned(
                left: 117.w,
                top: -148.h,
                child: Transform.rotate(
                  angle: 12.84 * 3.14159 / 180,
                  child: SvgPicture.asset(
                    AppAssets.starSvg,
                    alignment: Alignment.topCenter,
                    width: 432.w,
                    height: 432.h,
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, top: 67.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.whereAnimeComesAlive,
                      style: AppStyles.font24Bold,
                    ),
                    24.verticalSpace,
                    HomeChips(),
                    20.verticalSpace,
                    HomePostersListView(),
                    24.verticalSpace,
                    Text(AppStrings.topCharacters, style: AppStyles.font24Bold),
                    24.verticalSpace,
                    HomeCharactersListView(),
                  ],
                ),
              ),
            ],
          ),),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
