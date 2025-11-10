import 'package:flutter/material.dart';
import 'package:learn_bloc/constant/colors.dart';
import 'package:learn_bloc/data/models/character.dart';

class CharacterDetails extends StatelessWidget {
  final Results character;
  const CharacterDetails({super.key, required this.character});

  Widget buildSliverAppbar(){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: Container(
        width: double.infinity,
        color: Colors.black45,
        child: FlexibleSpaceBar(
          title: Text("${character.name}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyColors.myWhite,
          ),
          ),
          background: Hero(
            tag: character.id!,
            child: Image.network(character.image!,fit: BoxFit.cover
              ,),
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title,String value){
   return RichText(
     maxLines: 1,
       overflow: TextOverflow.ellipsis,
       text: TextSpan(
         children: [
           TextSpan(
             text: title,
             style: TextStyle(
               color: MyColors.myWhite,
               fontSize: 18,
               fontWeight: FontWeight.bold,
             ),
           ),
           TextSpan(
             text: value,
             style: TextStyle(
               color: MyColors.myWhite,
               fontSize: 16,
             ),
           ),
         ]
       )
   );
  }

  Widget buildDivider(double endIndent){
  return Divider(color: MyColors.myYellow,
  height: 30,
    thickness: 2,
    endIndent: endIndent,
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverList(delegate: SliverChildListDelegate((
          [
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Name : ",character.name! ),
                      buildDivider(310),
                      characterInfo("Location : ",character.location!.name! ),
                      buildDivider(290),
                      characterInfo("Status : ",character.status! ),
                      buildDivider(300),
                      characterInfo("Species : ",character.species! ),
                      buildDivider(300),
                      character.type!.isEmpty ?Container():
                      characterInfo("Type  : ",character.type! ),
                      character.type!.isEmpty ?Container():
                      buildDivider(310),
                      characterInfo("Gender : ",character.gender! ),
                      buildDivider(300),
                      characterInfo("Origin Name : ",character.origin!.name! ),
                      buildDivider(260),
                      characterInfo("Created : ",character.created! ),
                      buildDivider(290),
                    ],
                ),
          ),
            SizedBox(height: 400,)
          ]
          ),
          ),

      ),
      ],
    ),
    );
  }
}
