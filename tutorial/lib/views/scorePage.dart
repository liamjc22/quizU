import 'package:flutter/material.dart';
import 'package:tutorial/views/startPage.dart';

class ScorePage extends StatelessWidget {
  final double score;
  final TextStyle textStyle = TextStyle(color: Colors.white, letterSpacing: 6.0, decoration: TextDecoration.none);
  ScorePage(this.score);


  void goHome(context){ 
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

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
            RaisedButton(child: Text("Home"), onPressed: () {goHome(context);},)
          ],
        ),
      )
    );
  }

}