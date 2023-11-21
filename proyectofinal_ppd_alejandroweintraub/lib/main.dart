import 'package:flutter/material.dart';
import 'extensiones.dart';

void main() => runApp(Main());

const Map<String, double> sackleaders = {
  'Myles Garret': 13,
  'Danielle Hunter': 12,
  'T.J. Watt': 11.5,
  'Khalil Mack': 11.5,
  'Maxx Crosby': 10.5,
  'Kayvon Thibodeaux': 10.5,
  'Micah Parsons': 10,
  'Josh Allen': 9.5,
  'Trey Hendrickson': 9.5,
  'Leonard Floyd': 9.5,
  'Justin Madubuike': 9.5,
  'Win a Prize': 0,
};

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipalView(),
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
        ),
        body: ListView(children: [
          easyListTile('assets/vikings.png', 'Myles Garrett', '13.0', '1'),
          easyListTile('assets/vikings.png', 'Danielle Hunter', '12.0', '2'),
          easyListTile('assets/vikings.png', 'T.J. Watt', '11.5', '3'),
          easyListTile('assets/vikings.png', 'Khalil Mack', '11.5', '4'),
          easyListTile('assets/vikings.png', 'Maxx Crosby', '10.5', '5'),
          easyListTile('assets/vikings.png', 'Kayvon Thibodeaux', '10.5', '6'),
          easyListTile('assets/vikings.png', 'Micah Parsons', '10.0', '7'),
          easyListTile('assets/vikings.png', 'Josh Allen', '9.5', '8'),
          easyListTile('assets/vikings.png', 'Trey Hendrickson', '9.5', '9'),
          easyListTile('assets/vikings.png', 'Leonard Floyd', '9.5', '10'),
          easyListTile('assets/vikings.png', 'Justin Madubuike', '9.5', '11'),
        ]));
  }
}

class DetailPage extends StatelessWidget {
  Widget build(BuildContext context) {
    String playerName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(playerName)),
    );
  }
}




