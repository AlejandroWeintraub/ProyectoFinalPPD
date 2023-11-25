import 'package:flutter/material.dart';
import 'main.dart';
import 'extensiones.dart';
List<bool> favorites= [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

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

const List<String> playerImg = [
  'assets/mg.png',
  'assets/dh.png',
  'assets/tw.png',
  'assets/km.png',
  'assets/mc.png',
  'assets/kt.png',
  'assets/mp.png',
  'assets/ja.png',
  'assets/th.png',
  'assets/lf.png',
  'assets/jm.png',
  '',
  ];

List<List<Widget>> stats = [
  [
    Table(
      border: TableBorder(horizontalInside: BorderSide(width: 2, color: Colors.white12)),
      children: [
        TableRow(
          children: [
            TableCell(child: Text('Year', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('Tackles', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('Sacks', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('FF', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('FR', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('Int', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('TD', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2017', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('47', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('12', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('2', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2018', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('81', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('13', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('2', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2019', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('61', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('10', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('2', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2020', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('48', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('12', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2021',textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('71', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('16', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1',textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('3', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2022', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('68', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('16', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('2', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('2',textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0',textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2023', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('41', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('13', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('1',textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
            TableCell(child: Text('0', textScaler: TextScaler.linear(0.8), textAlign: TextAlign.center ,)),
          ],
        ),
      ],
    )
  ]
];
