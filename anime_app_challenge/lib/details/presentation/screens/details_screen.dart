import 'dart:ui';

import 'package:anime_app_challenge/core/theming/app_assets.dart';
import 'package:anime_app_challenge/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/details_button_sheet.dart';
import '../widgets/icon_with_description.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Build DetailsScreen');
    //height
    debugPrint('Height: ${MediaQuery.of(context).size.height * 0.691}');
    //width
    debugPrint('Width: ${MediaQuery.of(context).size.width}');
    ///825 * 392
    return Scaffold(
      backgroundColor: const Color(0xff2C1E51),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                AppAssets.detailsScreenBackgroundPoster,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.606,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.497,
                left: 97.w,
                child: Image.asset(
                  AppAssets.detailsScreenPosterNameView,
                  width: 193.w,
                  height: 147.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.691),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      children: List<Widget>.generate(movieCategories.length, (
                        index,
                      ) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),

                          ///Todo : Its like the design specially with blur required ??
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xffD9D9D9,
                                ).withValues(alpha: 0.24),
                                borderRadius: BorderRadius.circular(18.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                movieCategories[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeightHelper.medium,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    12.verticalSpace,
                    _buildDivider(),
                    10.verticalSpace,
                    _buildMovieStatus(),
                    10.verticalSpace,
                    _buildDivider(),
                    12.verticalSpace,
                    _buildMovieDescription(),
                    60.verticalSpace,
                  ],
                ),
              ),
              // _buildSideEllipseBlur(),
              // _buildDownPositionedEllipseBlur(),
            ],
          ),
        ),
      ),
      bottomSheet: DetailsButtonSheet(),
    );
  }

  Padding _buildMovieDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppAssets.fireSvgIcon, width: 30.w, height: 30),
          10.horizontalSpace,
          Expanded(
            child: Text(
              'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
              style: TextStyle(
                color: Color(0xffCBC4C4),
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildMovieStatus() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconWithDescription(
            iconPath: AppAssets.eyeSvgIcon,
            description: '2.8M views',
          ),
          IconWithDescription(
            iconPath: AppAssets.handClappingSvgIcon,
            description: '2k Claps',
          ),

          IconWithDescription(
            iconPath: AppAssets.parkSvgIcon,
            description: '4 Seasons',
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Color(0xff747272).withValues(alpha: 0.48),
      thickness: 1,
      indent: 21.w,
      endIndent: 20.w,
    );
  }

  ///Todo : Not like designTo be fixed later
  Positioned _buildDownPositionedEllipseBlur() {
    return Positioned(
      bottom: 0,
      left: -14,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.elliptical(108, 118)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.8, sigmaY: 12.8),
          child: Container(
            width: 108,
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(108, 118)),
              color: const Color(0xff5A3D57),
              border: Border.all(
                color: Colors.black,
                width: 0.1,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xff5A3D57).withOpacity(0.4),
                  const Color(0xff5A3D57).withOpacity(0.5),
                  const Color(0xff5A3D57).withOpacity(0.4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Todo : Not like designTo be fixed later
  Positioned _buildSideEllipseBlur() {
    return Positioned(
      left: 243,
      top: 494,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.elliptical(153, 130)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: 153,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(153, 130)),
              color: const Color(0xff713649).withOpacity(0.81),
              border: Border.all(
                color: Colors.black,
                width: 0.1,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xff713649).withOpacity(0.4),
                  const Color(0xff713649).withOpacity(0.5),
                  const Color(0xff713649).withOpacity(0.4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> movieCategories = ['Action', 'Adventure', 'Comedy'];
