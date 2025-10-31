import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class AppStyles {
  /// Example:
  // static TextStyle font16BlackMedium = TextStyle(
  //   fontSize: 16.sp,
  //   color: AppColors.blackColor,
  //   fontWeight: FontWeightHelper.medium,
  // );

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
}
