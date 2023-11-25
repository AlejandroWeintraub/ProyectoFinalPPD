import 'package:flutter/material.dart';
import 'package:proyectofinal_ppd_alejandroweintraub/InformationLists.dart';
import 'main.dart';

extension MorePlayerInfo on PrincipalViewState {
  static bool _isFavorite = false;
  goToDetailPage(int index, String playerName, String playerImage, String teams,
      List<Widget> CareerStats) async {
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
                  CareerStats,
                  _isFavorite
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
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeigth = MediaQuery.of(context).size.height;
    List<dynamic> playerName =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    final _isFavorite = playerName[4];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              playerName[2],
              width: (10 * ScreenWidth / 100),
              height: (10 * ScreenWidth / 100) ,
            ),
            Text(playerName[0]),
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
                        'Its not my favorite player',
                        textScaler: TextScaler.linear(0.8),
                      )
                    else
                      Text('Its my favorite player',
                          textScaler: TextScaler.linear(0.8))
                  ],
                ))
          ])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                      height: (ScreenHeigth * 20) / 100,
                      width: (ScreenHeigth * 20) / 100 ,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                playerName[1],
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                          color: Colors.white),
                    ),
                Text('''Player: '''),
              ]),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              miCardImage(),
              miCardImage(),
              miCardImage(),
              miCardImage(),
            ],
          )),
          playerName[3][0]
        ],
      ),
    );
  }
}

Card miCardImage() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(5),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            Container(
              width: (ScreenWidth * 20) / 100,
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Text(
                'Sacks',
                textScaler: TextScaler.linear(0.8),
              ),
            ),
            Text('13'),
          ],
        ),
      ));
}
