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
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    int leftDiceNumber = (rng.nextInt(6) + 1);
    int rightDiceNumber = (rng.nextInt(6) + 1);

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onPressed: () {
                  setState(() {
                    leftDiceNumber = 5;
                  });
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
                  setState(() {
                    rightDiceNumber = 6;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
