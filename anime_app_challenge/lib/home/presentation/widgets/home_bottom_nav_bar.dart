import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/theming/app_colors.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFF9F8FD),
      padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 22.h),
      child:  GNav(
        color: AppColors.lightGrayColor,
        activeColor: Colors.white,
        tabBackgroundColor: AppColors.primaryColor,
        gap: 10.w,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
        tabs: [
          GButton(icon: LineIcons.home, text: 'Home'),
          GButton(icon: LineIcons.search, text: 'Search'),
          GButton(icon: LineIcons.globe, text: 'Explore'),
          GButton(icon: LineIcons.cog, text: 'Settings'),
        ],
      ),
    );
  }
}
