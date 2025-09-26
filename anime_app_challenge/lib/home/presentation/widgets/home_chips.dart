import 'package:anime_app_challenge/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_styles.dart';

class HomeChips extends StatefulWidget {
  const HomeChips({super.key});

  @override
  State<HomeChips> createState() => _HomeChipsState();
}

class _HomeChipsState extends State<HomeChips> {
  int selectedIndex = 0;

  List<String> animeCategories = [
    'All',
    'Popular',
    'Trending',
    'New Releases',
    'Top Rated',
    'Upcoming',
    'Action',
    'Romance',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(animeCategories.length, (index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: ChoiceChip(
              label: Text(animeCategories[index]),
              showCheckmark: false,
              selected: isSelected,
              selectedColor: AppColors.primaryColor,
              backgroundColor: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              shape: StadiumBorder(),
              labelStyle: AppStyles.font14WhiteBold.copyWith(
                color: isSelected
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
              ),
              onSelected: (_) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
