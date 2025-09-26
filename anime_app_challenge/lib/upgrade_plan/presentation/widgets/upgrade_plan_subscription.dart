import 'package:anime_app_challenge/core/utils/spacing.dart';
import 'package:anime_app_challenge/upgrade_plan/presentation/widgets/plan_card.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_strings.dart';

class UpgradePlanSubscription extends StatefulWidget {
  const UpgradePlanSubscription({super.key});

  @override
  State<UpgradePlanSubscription> createState() =>
      _UpgradePlanSubscriptionState();
}

class _UpgradePlanSubscriptionState extends State<UpgradePlanSubscription> {
  bool isMonthlySelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          /// Monthly Plan
          GestureDetector(
            onTap: () {
              setState(() {
                isMonthlySelected = true;
              });
            },
            child: PlanCard(
              imagePath: AppAssets.upgradePlanPeriodImage,
              title: AppStrings.monthlyPlan,
              price: AppStrings.monthlyPrice,
              priceSuffix: AppStrings.monthlyPricePerMonth,
              description: AppStrings.monthlyDescription,
              isSelected: isMonthlySelected,
            ),
          ),

          20.verticalSpace,

          /// Annually Plan
          GestureDetector(
            onTap: () {
              setState(() {
                isMonthlySelected = false;
              });
            },
            child: PlanCard(
              imagePath: AppAssets.upgradePlanPeriodImage,
              title: AppStrings.annuallyPlan,
              price: AppStrings.annuallyPrice,
              priceSuffix: AppStrings.annuallyPricePerYear,
              description: AppStrings.annuallyDescription,
              isSelected: !isMonthlySelected,
            ),
          ),
        ],
      ),
    );
  }
}
