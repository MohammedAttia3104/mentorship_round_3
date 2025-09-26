import 'package:anime_app_challenge/core/networking/api_result.dart';

import '../entities/anime_character_entity.dart';

abstract class CharactersRepository {
  Future<ApiResult<List<AnimeCharacterEntity>>> getCharacters();
}
