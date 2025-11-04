import 'package:flutter/cupertino.dart';
import 'package:learn_bloc/presention/screens/characterDetails.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/presention/screens/charactersScreen.dart';
import 'constant/string.dart';
class AppRouter{

  Route? generateRoute(RouteSettings setting){
    switch(setting.name){
      case characterScreen:
        return MaterialPageRoute(builder: (_)=>CharactersScreen());
        break;
      case charactersDetails:
        return MaterialPageRoute(builder: (_)=>Characterdetails());
    }
    return null;
  }
}