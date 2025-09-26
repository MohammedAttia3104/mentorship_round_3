import '../../domain/entities/anime_character_entity.dart';
import '../models/anime_character.dart';

extension AnimeCharacterMapper on AnimeCharacter {
  AnimeCharacterEntity toEntity() {
    return AnimeCharacterEntity(
      name: name,
      imageUrl: imageUrl,
      topMovie: topMovie,
    );
  }
}
