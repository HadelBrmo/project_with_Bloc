import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
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
  late List<Results> searchedCharacters;
  bool isSearching=false;
  TextEditingController searchController=TextEditingController();

  Widget buildSearchField(){
    return TextFormField(
      controller: searchController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find Characters ...",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      style:TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacters){
        addSearchedFOrItemsToSearchedList(searchedCharacters);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {

    });
  }

  List<Widget> buildAppbarAction(){
    if(isSearching){
      return [
        IconButton(onPressed: (){
          clearData();
          Navigator.pop(context);
        }, icon: Icon(Icons.clear,color: MyColors.myGrey,))];
    }
    else{
      return[
        IconButton(onPressed: startSearch,
        icon: Icon(Icons.search,color: MyColors.myGrey,))
      ];
    }
  }

  void startSearch(){
   ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: startStoping
   ));
  setState(() {
    isSearching=true;
  });
  }

  void startStoping(){
   clearData();
   setState(() {
     isSearching=false;
   });
  }

  void clearData(){
  setState(() {
    searchController.clear();
  });
  }

  Widget buildBlockWidget(){
    return BlocBuilder<CharactersCubit,CharacterState>(builder:(context,state){
      if(state is CharactersLoaded){
        allCharacters=(state).characters;
        return buildLoadedListWidget();
      }
      else{
        return Center(child: CircularProgressIndicator(color: MyColors.myYellow,));
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
      itemCount:searchController.text.isEmpty? allCharacters.length:searchedCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(character:searchController.text.isEmpty? allCharacters[index]:
        searchedCharacters[index]  );
      },
    );
  }

  Widget buildNoInternet(){
    return   Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/no_internet.png')
          ],
        ),
      ),
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
     toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top:  Radius.circular( 20),
          ),
        ),
        title: (isSearching)?buildSearchField() : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Characters",
          style: TextStyle(
              color: MyColors.myGrey,
            fontSize: 20
          ),
          ),
        ),
        backgroundColor: MyColors.myYellow,
        actions: buildAppbarAction(),
      ),
      body: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
              ) {
            final bool connected = !connectivity.contains(ConnectivityResult.none);
            if(connected){
              return  buildBlockWidget();
            }
            else{
              return buildNoInternet();
            }

          },
        child: Center(
          child: CircularProgressIndicator(color: MyColors.myYellow),
        ),
    )
    );
  }
}