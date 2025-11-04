part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<Results> characters;
  CharactersLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String message;
  CharacterError(this.message);
}