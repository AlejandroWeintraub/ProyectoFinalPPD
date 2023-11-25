import 'package:flutter/material.dart';
import 'extensiones.dart';
import 'InformationLists.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _ScreenWidth = MediaQuery. of(context).size.width;
    double _ScreenHeigth = MediaQuery. of(context).size.height;
    return MaterialApp(
      home: PrincipalView(),
      theme: ThemeData.dark(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  @override
  PrincipalViewState createState() => PrincipalViewState();
}

class PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NFL Sack Leaders'),
          backgroundColor: Colors.grey[900],
        ),
        body: Container(
          child: ListView.separated(
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
                    Visibility(visible: favorites[index] ?? false, child: Icon(Icons.favorite, color: Colors.pink,))
                  ]),
                  trailing: Text(sacks[index],
                      textScaler: TextScaler.linear(1.5),
                      textAlign: TextAlign.center),
                  onTap: () => goToDetailPage(
                    index,
                    titles[index],
                    playerImg[index],
                    teams[index],
                    stats[index],
                  ),
                );
              }),
        ));
  }
}


