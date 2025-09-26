import 'package:anime_app_challenge/core/networking/api_result.dart';
import 'package:anime_app_challenge/home/domain/entities/anime_character_entity.dart';
import 'package:anime_app_challenge/home/domain/repositories/characters_repository.dart';

class GetCharactersMockUpUseCase {
  final CharactersRepository repository;
  GetCharactersMockUpUseCase({required this.repository});

  Future<ApiResult<List<AnimeCharacterEntity>>> call() async {
    return await repository.getCharacters();
  }
}