import 'package:anime_app_challenge/core/utils/spacing.dart';
import 'package:anime_app_challenge/home/presentation/widgets/poster_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/app_styles.dart';
import '../../data/models/poster.dart';

class PosterListViewItem extends StatelessWidget {
  final Poster poster;

  const PosterListViewItem({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterItem(poster: poster),
        8.verticalSpace,
        Text(poster.title, style: AppStyles.font14Bold),
        4.verticalSpace,
        Text(
          poster.category,
          style: AppStyles.font14Bold.copyWith(
            color: const Color(0xFF6C6B7A),
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
