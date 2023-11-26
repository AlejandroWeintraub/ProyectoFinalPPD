import 'package:flutter/material.dart';
import 'main.dart';
import 'extensiones.dart';

List<bool> favorites = [
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
  'Create an account',
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

const List<String> playerInfo = [
  '''
Position: Defensive End
Team: Cleveland Browns
College: Texas A&M University
Draft: 2017 NFL Draft, 1st overall
Height: 6'5"
Weight: 275 lbs
Hometown: Arlington, Texas
''',
  '''
Full Name: Danielle Hunter
Position: Defensive End
Team: Minnesota Vikings
College: Louisiana State University
Draft: 2015 NFL Draft, 88th overall
Height: 6'5"
Weight: 280 lbs
Hometown: Houston, Texas
''',
  '''
 Full Name: Trent Jordan Watt
 Position: Outside Linebacker
 Team: Pittsburgh Steelers
 College: Wisconsin Badgers
 Draft: 2017 NFL Draft, 30th overall
 Height: 6'4"
 Weight: 252 lbs
 Hometown: Pewaukee, Wisconsin
''',
  '''
Full Name: Khalil Mack
Position: Outside Linebacker
Team: Los Angeles Chargers
College: Buffalo
Draft: 2014 NFL Draft, 5th overall
Height: 6'3"
Weight: 248 lbs
Hometown: Greenville, Illinois
''',
  '''
Full Name: Maxx Robert Crosby
Position: Defensive End
Team: Las Vegas Raiders
College: Eastern Michigan University
Draft: 2019 NFL Draft, 12th overall
Height: 6'5"
Weight: 255 lbs
Hometown: Colerain Township, Ohio
''',
  '''
Full Name: Kayvon Thibodeaux
  Position: Defensive End
  Team: New York Giants
  College: Oregon Ducks
  Draft: 2022 NFL Draft, 5th overall
  Height: 6'3"
  Weight: 258 lbs
  Hometown: Los Angeles, California
''',
  '''
Full Name: Micah Parsons
Position: Linebacker
Team: Dallas Cowboys
College: Penn State Nittany Lions
Draft: 2021 NFL Draft, 12th overall
Height: 6'3"
Weight: 245 lbs
Hometown: Harrisburg, Pennsylvania
''',
  '''
Full Name: Joshua Allen
Position: Defensive End
Team: Jacksonville Jaguars
College: Kentucky Wildcats
Draft: 2019 NFL Draft, 7th overall
Height: 6'5"
Weight: 265 lbs
Hometown: Montgomery, Alabama
''',
  '''
Full Name: Trey Hendrickson
Position: Defensive End
Team: Cincinnati Bengals
College: Miami (FL)
Draft: 2019 NFL Draft, 103rd overall
Height: 6'1"
Weight: 220 lbs
Hometown: Fort Lauderdale, Florida
''',
  '''
Full Name: Leonard Floyd
Position: Linebacker
Team: Los Angeles Rams
College: Georgia Bulldogs
Draft: 2016 NFL Draft, 9th overall
Height: 6'0"
Weight: 234 lbs
Hometown: Maxton, North Carolina
''',
  '''
Full Name: Justin Madubuike
Position: Defensive Tackle
Team: Baltimore Ravens
College: Texas A&M Aggies
Draft: 2020 NFL Draft, 32nd overall
Height: 6'3"
Weight: 318 lbs
Hometown: Fort Worth, Texas
''',
''
];

List<List<num>> careerStats = [
  [352, 101, 23, 1],
  [338, 79.5, 25, 1],
  [321, 68.5, 23, 2],
  [778, 76.5, 30, 6],
  [245, 34.5, 16, 1],
  [107, 12, 5, 0],
  [258, 40, 15, 3],
  [172, 21, 10, 0],
  [192, 34.5, 12, 0],
  [421,39,10,2],
  [121,13,5,0],
  []
];
