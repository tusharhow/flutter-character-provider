part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class CharacterFetch extends CharacterEvent {
  final String? query;

  CharacterFetch({this.query});
}
