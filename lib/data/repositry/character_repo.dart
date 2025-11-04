import 'package:learn_bloc/data/models/character.dart';
import 'package:learn_bloc/data/web_services/apiServices.dart';

class CharacterRepository {
  final ApiServices apiServices;
  CharacterRepository(this.apiServices);

  Future<List<Results>> getAllCharacters() async {
    final characters = await apiServices.getAllCharacters();
    return characters.results ?? [];
  }
}