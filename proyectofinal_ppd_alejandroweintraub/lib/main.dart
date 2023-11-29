import 'package:flutter/material.dart';
import 'extensiones.dart';
import 'InformationLists.dart';
import 'contactpage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _ScreenWidth = MediaQuery.of(context).size.width;
    double _ScreenHeigth = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: PrincipalView(),
      theme: ThemeData.dark(),
    );
  }
}

class PrincipalView extends StatefulWidget  {
  @override
  PrincipalViewState createState() => PrincipalViewState();
}

class PrincipalViewState extends State<PrincipalView> with  SingleTickerProviderStateMixin{
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
  
  @override
  Widget build(BuildContext context) {
     _animationController.forward(); // Start the animation
    return Scaffold(
        appBar: AppBar(
          title: Text('NFL Sack Leaders'),
          backgroundColor: Colors.grey[900],
        ),
        body: FadeTransition(opacity: _fadeInAnimation, child: ListView.separated(
            itemCount: titles.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  ranking[index],
                  textScaler: TextScaler.linear(1.5),
                ),
                title: Row(children: [
                  Image(
                    image: AssetImage(teams[index]),
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(titles[index]),
                  Visibility(
                      visible: favorites[index] ?? false,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ))
                ]),
                subtitle: Text(description[index]),
                trailing: Text(sacks[index],
                    textScaler: TextScaler.linear(1.5),
                    textAlign: TextAlign.center),
                onTap: () {
                  if (index != 11) {
                    goToDetailPage(
                        index,
                        titles[index],
                        playerImg[index],
                        teams[index],
                        careerStats[index],
                        playerInfo[index],
                        favorites[index]);
                  } else {
                    goToContactPage(titles[index]);
                  }
                },
              );
            })));
  }
}
