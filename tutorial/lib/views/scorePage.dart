import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final double score;
  final TextStyle textStyle = TextStyle(color: Colors.white, letterSpacing: 6.0, decoration: TextDecoration.none);
  ScorePage(this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your Score", style: textStyle),
            Text((score*100).toString() + " %", style: textStyle),

            // CircularProgressIndicator(value: score),
            RaisedButton(child: Text("Home"), onPressed: () {},)
          ],
        ),
      )
    );
  }

}