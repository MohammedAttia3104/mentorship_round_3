import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';

class PlanCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String priceSuffix;
  final String description;
  final bool isSelected;

  const PlanCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.priceSuffix,
    required this.description,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.fontPrimaryColor,
              borderRadius: BorderRadius.circular(20.r),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 108.h,
            width: 108.w,
            fit: BoxFit.cover,
          ),
          22.horizontalSpace,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.5).h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppStyles.font16WhiteBold.copyWith(
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.fontPrimaryColor,
                          ),
                        ),
                        8.verticalSpace,
                        RichText(
                          text: TextSpan(
                            text: price,
                            style: AppStyles.font14WhiteBold.copyWith(
                              color: isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.fontPrimaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: priceSuffix,
                                style: AppStyles.font14WhiteBold.copyWith(
                                  color: const Color(0xffA49AD8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        8.verticalSpace,
                        Text(description, style: AppStyles.font12BoldPlan),
                      ],
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xff5436F8) : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: isSelected
                          ? null
                          : Border.all(color: Color(0xff18153F), width: 1.5.w),
                    ),
                    child: Icon(Icons.check, size: 16.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
