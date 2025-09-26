import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_state.freezed.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.initial() = _Initial;
}
