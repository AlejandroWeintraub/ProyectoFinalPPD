import 'package:flutter/material.dart';
import 'package:proyectofinal_ppd_alejandroweintraub/InformationLists.dart';
import 'main.dart';
import 'components.dart';

extension MorePlayerInfo on PrincipalViewState {
  Animation getAnimation(AnimationController controller) {
    return Tween(begin: 100.0, end: 500.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
  }

  static bool _isFavorite = false;
  goToDetailPage(
      int index,
      String playerName,
      String playerImage,
      String teams,
      List<num> stats,
      String playerInfo,
      bool _isFavorite2,
      AnimationController controller) async {
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
                  playerInfo,
                  controller
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

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
          _animationController.forward(); // Start the animation
          if (orientation == Orientation.portrait) {
            return PortraitDistributionPlayer(context, playerName, _isFavorite);
          } else {
            return LandScapeDistributionPlayer(
                context, playerName, _isFavorite);
          }
        }));
  }

  Widget PortraitDistributionPlayer(
      BuildContext context, List<dynamic> playerName, bool _isFavorite) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeInAnimation, // Use the existing animation
              child: Image.asset(
                playerName[2],
                width: (20 * ScreenWidth / 100),
                height: (20 * ScreenWidth / 100),
              ),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
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
                  )),
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
    ));
  }

  Widget LandScapeDistributionPlayer(
      BuildContext context, List<dynamic> playerName, bool _isFavorite) {
    return SingleChildScrollView(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeTransition(
            opacity: _fadeInAnimation, // Use the existing animation
            child: Image.asset(
              playerName[2],
              width: (20 * ScreenWidth / 100),
              height: (20 * ScreenWidth / 100),
            ),
          ),
          ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
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
              )),
          Text(
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
    ]));
  }
}
