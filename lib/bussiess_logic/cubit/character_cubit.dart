import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/repositry/character_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/character.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  late List<Results> characters;
  CharactersCubit(this.characterRepository) : super(CharacterInitial());

  List<Results> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters=characters;
    }
    );
    return characters;
  }
}