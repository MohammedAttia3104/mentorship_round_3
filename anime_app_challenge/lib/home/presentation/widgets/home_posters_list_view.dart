import 'package:anime_app_challenge/core/theming/app_assets.dart';
import 'package:anime_app_challenge/details/presentation/screens/details_screen.dart';
import 'package:anime_app_challenge/home/data/models/poster.dart';
import 'package:anime_app_challenge/home/presentation/widgets/poster_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePostersListView extends StatelessWidget {
  const HomePostersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final poster = posters[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen()),
            ),
            child: PosterListViewItem(poster: poster),
          );
        },
        separatorBuilder: (context, index) => 14.horizontalSpace,
        itemCount: posters.length,
      ),
    );
  }
}

List<Poster> posters = [
  Poster(
    image: AppAssets.canonPoster,
    title: 'Detective Canon',
    category: 'Mystery',
    rating: 4.8,
  ),
  Poster(
    image: AppAssets.hunterXHunterPoster,
    title: 'Hunter X Hunter',
    category: 'Adventure',
    rating: 5.0,
  ),

  Poster(
    image: AppAssets.dragonBallPoster,
    title: 'Dragon Ball',
    category: 'Action',
    rating: 3.6,
  ),
  Poster(
    image: AppAssets.canonPoster,
    title: 'Detective Canon',
    category: 'Mystery',
    rating: 4.8,
  ),
  Poster(
    image: AppAssets.hunterXHunterPoster,
    title: 'Hunter X Hunter',
    category: 'Adventure',
    rating: 5.0,
  ),

  Poster(
    image: AppAssets.dragonBallPoster,
    title: 'Dragon Ball',
    category: 'Action',
    rating: 3.6,
  ),
];
