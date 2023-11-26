import 'package:flutter/material.dart';
import 'package:proyectofinal_ppd_alejandroweintraub/InformationLists.dart';
import 'main.dart';
import 'components.dart';

extension MorePlayerInfo on PrincipalViewState {
  
  static bool _isFavorite = false;
  goToDetailPage(int index, String playerName, String playerImage, String teams,
      List<num> stats, String playerInfo, bool _isFavorite2) async {
    _isFavorite = await Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    DetailPage(),
                transitionDuration: Duration(milliseconds: 400),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 1.0),
                      end: Offset(0.0, 0.0),
                    ).animate(animation),
                    child: child,
                  );
                },
                settings: RouteSettings(arguments: [
                  playerName,
                  playerImage,
                  teams,
                  _isFavorite2,
                  stats,
                  playerInfo
                ]))) ??
        _isFavorite;
    setState(() {
      favorites[index] = _isFavorite;
      print(favorites);
    });
    ;
  }



}
  



double ScreenWidth = 0.0;
double ScreenHeigth = 0.0;



class DetailPage extends StatelessWidget {  

  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeigth = MediaQuery.of(context).size.height;
    List<dynamic> playerName =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    final _isFavorite = playerName[3];
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[900],
            title: Row(children: [
              Text(playerName[0]),
            ])),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return PortraitDistributionPlayer(context, playerName, _isFavorite);
          } else {
            return LandScapeDistributionPlayer(context, playerName, _isFavorite);
          }
        }));
  }
}

  
Widget PortraitDistributionPlayer( 
    BuildContext context, List<dynamic> playerName, bool _isFavorite) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
            playerName[2],
            width: (20 * ScreenWidth / 100),
            height: (20 * ScreenWidth / 100),
          )
        ],
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (ScreenHeigth * 30) / 100,
              width: (ScreenHeigth * 30) / 100,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        playerName[1],
                      ),
                      fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
            ),
          ]),
      Text(
        playerName[5],
        textAlign: TextAlign.justify,
      ),
      CardsBuildPortrait(context, playerName[4]),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              !_isFavorite,
            );
          },
          child: Column(
            children: [
              if (_isFavorite)
                Icon(Icons.favorite, color: Colors.pink)
              else
                Icon(Icons.favorite_border, color: Colors.grey),
              if (_isFavorite)
                Text(
                  'Un-favorite player',
                  textScaler: TextScaler.linear(0.8),
                )
              else
                Text('Its my favorite player',
                    textScaler: TextScaler.linear(0.8))
            ],
          ))
    ],
  );
}

Widget LandScapeDistributionPlayer(
    BuildContext context, List<dynamic> playerName, bool _isFavorite) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Image.asset(
            playerName[2],
            width: (20 * ScreenHeigth / 100),
            height: (20 * ScreenHeigth / 100),
          ), Container(
              height: (ScreenWidth * 20) / 100,
              width: (ScreenWidth * 20) / 100,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        playerName[1],
                      ),
                      fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
            ), Text(
        playerName[5],
        textAlign: TextAlign.justify,
      ),
      ],
    ),
  CardsBuildLandscape(context, playerName[4]),
  ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              !_isFavorite,
            );
          },
          child: Column(
            children: [
              if (_isFavorite)
                Icon(Icons.favorite, color: Colors.pink)
              else
                Icon(Icons.favorite_border, color: Colors.grey),
              if (_isFavorite)
                Text(
                  'Un-favorite player',
                  textScaler: TextScaler.linear(0.8),
                )
              else
                Text('Its my favorite player',
                    textScaler: TextScaler.linear(0.8))
            ],
          ))
    
  ]);
}
