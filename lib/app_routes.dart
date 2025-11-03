import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/presention/screens/products.dart';

class AppRouter{
  //
  Route? generateRoute(RouteSettings setting){
    switch(setting.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>Products());
    }
    return null;
  }
}