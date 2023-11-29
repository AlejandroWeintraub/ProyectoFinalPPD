import 'package:flutter/material.dart';
import 'extensiones.dart';
import 'main.dart';

 Widget buildPositionedWidget( String x, AnimationController y) {
    int intValue = y.value.toInt();
    return Positioned(
      left: 150,
        top: y.value,
      child: Image.asset(
            x,
            width: (20 * ScreenWidth / 100),
            height: (20 * ScreenWidth / 100),
          ),
        
      );
  }

Card miCardImagePortrait(String label, num stat) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(5),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            Container(
              width: (ScreenWidth * 30) / 100,
              height: (ScreenWidth * 10) / 100,
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Text(
                label,
                textScaler: TextScaler.linear(1),
                textAlign: TextAlign.center,
              ),
            ),
            Text('$stat'),
          ],
        ),
      ));
}
Card miCardImagelandscape(String label, num stat) {
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
              height: (ScreenWidth * 5) / 100,
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Text(
                label,
                textScaler: TextScaler.linear(1.2),
                textAlign: TextAlign.center,
              ),
            ),
            Text('$stat'),
          ],
        ),
      ));
}

Widget CardsBuildPortrait(BuildContext context, List<num> stats) {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        miCardImagePortrait('Tackles', stats[0]),
        miCardImagePortrait('Sacks', stats[1]),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        miCardImagePortrait('FF', stats[2]),
        miCardImagePortrait('Interceptions', stats[3]),
      ],
    ),
  ]));
}

Widget CardsBuildLandscape(BuildContext context, List<num> stats) {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        miCardImagelandscape('Tackles', stats[0]),
        miCardImagelandscape('Sacks', stats[1]),
        miCardImagelandscape('FF', stats[2]),
        miCardImagelandscape('Interceptions', stats[3]),
      ],
    ),
  ]));
}