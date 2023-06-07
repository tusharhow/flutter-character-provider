part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded({required this.characters});
}

class CharacterFailure extends CharacterState {
  final String error;

  CharacterFailure(this.error);
}
