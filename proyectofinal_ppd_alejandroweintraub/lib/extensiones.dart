import 'package:flutter/material.dart';
import 'main.dart';



extension MorePlayerInfo on PrincipalViewState {
  goToDetailPage(String playerName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(),
            settings: RouteSettings(arguments: playerName)));
  }


Widget easyListTile(
    String asset, String playerName, String Sacks, String ranking) {
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$ranking |'),
        Image(image: AssetImage(asset), width: 32),
        Text(playerName),
        Text(' $Sacks '),
      ],
    ),
    onTap: () => goToDetailPage(playerName),
  );
}

}