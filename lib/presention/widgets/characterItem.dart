import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Results  character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
     return Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
          borderRadius: BorderRadius.circular(10),
        ),
child: GridTile(child: Container(
   color: MyColors.myGrey,
  child: character.image!.isNotEmpty?
  FadeInImage.assetNetwork(
    width: double.infinity,
      height: double.infinity,
      placeholder: "assets/animations/loading.gif",
      image: character.image!,fit: BoxFit.cover,): Container(),
),
  footer: Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  color: Colors.black54,
  alignment: Alignment.bottomCenter,
  child: Text(
    '${character.name}',
    style: TextStyle(
      height: 1.3,
      fontSize: 16,
      color: MyColors.myWhite,
      fontWeight: FontWeight.bold,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    textAlign: TextAlign.center,
  ),
),
     ),

  );
  }
}
