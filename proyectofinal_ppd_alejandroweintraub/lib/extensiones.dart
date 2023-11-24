import 'package:flutter/material.dart';
import 'main.dart';



extension MorePlayerInfo on PrincipalViewState {
  goToDetailPage(String playerName, String playerImage) {
    Navigator.push(
        context,
        
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secondaryAnimation, child){
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                end: Offset(0.0, 0.0),
        ).animate(animation),
                child: child,
              );
                
            },
            settings: RouteSettings(arguments: [playerName, playerImage])
            
            )
            );
            
  }



}