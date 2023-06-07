import 'package:bloc/bloc.dart';
import 'package:flutter_character_app/app/models/character_model.dart';
import 'package:flutter_character_app/app/services/api_service.dart';
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterFetch>((event, emit) async {
      emit(CharacterLoading());
      try {
        final List<Character> characters =
            await RemoteServices.fetchCharacters();
        emit(CharacterLoaded(characters: characters));
      } catch (e) {
        emit(CharacterFailure(e.toString()));
      }
    });
  }
}
