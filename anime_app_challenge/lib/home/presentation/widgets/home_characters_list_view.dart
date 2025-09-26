import 'package:anime_app_challenge/home/domain/entities/anime_character_entity.dart';
import 'package:anime_app_challenge/home/presentation/widgets/top_character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_assets.dart';

class HomeCharactersListView extends StatelessWidget {
  const HomeCharactersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width * 0.44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final character = animeCharacters[index];
          return TopCharacterItem(character);
        },
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemCount: animeCharacters.length,
      ),
    );
  }
}

List<AnimeCharacterEntity> animeCharacters = [
  AnimeCharacterEntity(
    name: 'Gon Freecss',
    topMovie: 'Hunter X Hunter',
    imageUrl: AppAssets.animeCharacterOne,
  ),
  AnimeCharacterEntity(
    name: 'Naruto Uzumaki',
    topMovie: 'Naruto',
    imageUrl: AppAssets.animeCharacterTwo,
  ),
  AnimeCharacterEntity(
    name: 'Luffy',
    topMovie: 'One Piece',
    imageUrl: AppAssets.animeCharacterThree,
  ),
  AnimeCharacterEntity(
    name: 'Gon Freecss',
    topMovie: 'Hunter X Hunter',
    imageUrl: AppAssets.animeCharacterOne,
  ),
  AnimeCharacterEntity(
    name: 'Naruto Uzumaki',
    topMovie: 'Naruto',
    imageUrl: AppAssets.animeCharacterTwo,
  ),
  AnimeCharacterEntity(
    name: 'Luffy',
    topMovie: 'One Piece',
    imageUrl: AppAssets.animeCharacterThree,
  ),
  AnimeCharacterEntity(
    name: 'Gon Freecss',
    topMovie: 'Hunter X Hunter',
    imageUrl: AppAssets.animeCharacterOne,
  ),
  AnimeCharacterEntity(
    name: 'Naruto Uzumaki',
    topMovie: 'Naruto',
    imageUrl: AppAssets.animeCharacterTwo,
  ),
  AnimeCharacterEntity(
    name: 'Luffy',
    topMovie: 'One Piece',
    imageUrl: AppAssets.animeCharacterThree,
  ),
];
