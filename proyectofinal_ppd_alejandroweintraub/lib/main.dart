import 'package:flutter/material.dart';
import 'extensiones.dart';

void main() => runApp(Main());

const List<String> titles = [
  'Myles Garrett',
  'Danielle Hunter',
  'T.J. Watt',
  'Khalil Mack',
  'Maxx Crosby',
  'Kayvon Thibodeaux',
  'Micah Parsons',
  'Josh Allen',
  'Trey Hendrickson',
  'Leonard Floyd',
  'Justin Madubuike',
  'Win a Prize',
];

const List<String> ranking = [
  '1',
  '2',
  '3',
  '4',
  'T5',
  'T5',
  '7',
  'T8',
  'T8',
  'T8',
  'T8',
  '',
];

const List<String> sacks = [
  '13.0',
  '12.0',
  '11.5',
  '11.0',
  '10.5',
  '10.5',
  '10.0',
  '9.5',
  '9.5',
  '9.5',
  '9.5',
  '',
];

const List<String> teams = [
  'assets/browns.png',
  'assets/vikings.png',
  'assets/steelers.png',
  'assets/chargers.png',
  'assets/raiders.png',
  'assets/giants.png',
  'assets/dallas.png',
  'assets/jaguars.png',
  'assets/bengals.png',
  'assets/bills.png',
  'assets/ravens.png',
  'assets/prize.png',
];

const List<String> playerImg = ['assets/mg.png'];

const List<List<String>> playerinfo = [
  [
    'Name: Myles Garrett',
    'Position: Defensive End',
    'Team: Cleveland Browns',
    'College: Texas A&M',
    "Height: 6'4\"",
    'Weight: 272 lbs',
    'Draft: 1st overall in the 2017 NFL Draft',
  ],
  [
    "Name: Danielle Hunter",
    "Position: Defensive End",
    "Team: Minnesota Vikings",
    "College: LSU",
    "Height: 6'5\"",
    "Weight: 263 lbs",
    "Draft: 3rd round (88th overall) in the 2015 NFL Draft",
  ],
  [
    "Name: T.J. Watt",
    "Position: Defensive End",
    "Team: Pittsburgh Steelers",
    "College: Wisconsin",
    "Height: 6'4\"",
    "Weight: 243 lbs",
    "Draft: 1st round (30th overall) in the 2017 NFL Draft",
  ],
];

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    Text(titles[index])
                  ]),
                  trailing: Text(sacks[index],
                      textScaler: TextScaler.linear(1.5),
                      textAlign: TextAlign.center),
                  onTap: () => goToDetailPage(titles[index], playerImg[index]),
                );
              }),
        ));
  }
}

class DetailPage extends StatelessWidget {
  Widget build(BuildContext context) {
    List<String> playerName =
        ModalRoute.of(context)?.settings.arguments as List<String>;

    print(playerName);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200.0,
          backgroundColor: Colors.grey[900],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(playerName[1]), fit: BoxFit.contain),
                  shape: BoxShape.circle,
                  color: Colors.white
                  ),
            ),
            Text(playerName[0], textAlign: TextAlign.center),
          ]),
        ),
        body: Column(children: []));
  }
}
