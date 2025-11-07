import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bussiess_logic/cubit/character_cubit.dart';
import 'package:learn_bloc/constant/colors.dart';

import '../../data/models/character.dart';
import '../widgets/characterItem.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Results> allCharacters;

  Widget buildBlockWidget(){
    return BlocBuilder<CharactersCubit,CharacterState>(builder:(context,state){
      if(state is CharactersLoaded){
        allCharacters=(state).characters;
        return buildLoadedListWidget();
      }
      else{
        return Text("Error");
      }
    });
  }

  Widget buildLoadedListWidget() {
    return Container(
      color: MyColors.myGrey,
      child: Column(
        children: [
          Expanded(
            child: buildCharactersList(),
          ),
        ],
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      // padding: EdgeInsets.all(8),
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: allCharacters[index],);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     toolbarHeight: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top:  Radius.circular( 20),
          ),
        ),
        title: Text(
          "Characters",
        style: TextStyle(
            color: MyColors.myGrey,
          fontSize: 20
        ),
        ),
        backgroundColor: MyColors.myYellow,

        centerTitle: true,
      ),
      body: buildBlockWidget(),
    );
  }
}