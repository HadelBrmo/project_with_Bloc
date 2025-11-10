import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/data/models/character.dart';
import 'package:learn_bloc/data/web_services/apiServices.dart';
import 'package:learn_bloc/presention/screens/characterDetails.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/presention/screens/charactersScreen.dart';
import 'bussiess_logic/cubit/character_cubit.dart';
import 'constant/string.dart';
import 'data/repositry/character_repo.dart';
class AppRouter{
  late final CharactersCubit charactersCubit;
  late final CharacterRepository characterRepository;

  AppRouter(){
    characterRepository=CharacterRepository(ApiServices());
    charactersCubit=CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings setting){
    switch(setting.name){
      case characterScreen:
        return MaterialPageRoute(builder: (_)=>BlocProvider(create:
        (BuildContext context)=>charactersCubit,
          child: CharactersScreen(),
        ),
        );
        break;
      case charactersDetails:
        final character = setting.arguments as Results;
        return MaterialPageRoute(builder: (_)=>CharacterDetails(character: character,));
    }
    return null;
  }
}