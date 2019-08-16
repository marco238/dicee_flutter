import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            'Dicee 🎲',
            style: TextStyle(letterSpacing: 2.5),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 6;
  int rightDiceNumber = 6;
  int score = 0;
  int rolls = 0;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      calculateScoreAndRolls();
    });
  }

  void calculateScoreAndRolls() {
    score = leftDiceNumber + rightDiceNumber;
    rolls = rolls + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: changeDiceFace,
          child: Column(
            children: <Widget>[
              Text(
                'Tap to roll`em',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.touch_app,
                size: 40.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  onPressed: () {
                    changeDiceFace();
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: () {
                    changeDiceFace();
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 100.0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Score: ',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  Text(
                    '$score',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rolls: ',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  Text(
                    '$rolls',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
