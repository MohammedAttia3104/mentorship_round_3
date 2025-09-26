import 'package:anime_app_challenge/core/networking/api_result.dart';
import 'package:anime_app_challenge/home/data/data_sources/characters_remote_data_source.dart';
import 'package:anime_app_challenge/home/data/mapper/anime_character_mapper.dart';
import 'package:anime_app_challenge/home/data/models/anime_character.dart';

import '../../../core/networking/api_error_handler.dart';
import '../../domain/entities/anime_character_entity.dart';
import '../../domain/repositories/characters_repository.dart';

class CharactersRepositoryImplementation implements CharactersRepository {
  final CharactersRemoteDataSource charactersRemoteDataSource;

  CharactersRepositoryImplementation({
    required this.charactersRemoteDataSource,
  });

  @override
  Future<ApiResult<List<AnimeCharacterEntity>>> getCharacters() async {
    try {
      final List<AnimeCharacter> characters = await charactersRemoteDataSource
          .getCharacters();

      final charactersEntities = characters
          .map((character) => character.toEntity())
          .toList();

      return ApiResult.success(charactersEntities);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
