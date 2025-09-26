import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'characters_state.dart';


class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(const CharactersState.initial());
}
