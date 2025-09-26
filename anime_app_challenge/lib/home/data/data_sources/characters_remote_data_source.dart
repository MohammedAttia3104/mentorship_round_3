import 'package:anime_app_challenge/home/data/models/anime_character.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://sample.com/api/')
abstract class CharactersRemoteDataSource {
  factory CharactersRemoteDataSource(Dio dio, {String baseUrl}) =
      _CharactersRemoteDataSource;

  @GET('/characters')
  Future<List<AnimeCharacter>> getCharacters();
}
