import 'package:flutter/material.dart';
import 'package:tutorial/models/question.dart';

import '../quizState.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final int index;
  QuestionCard(this.question, this.index);

  @override
  State<StatefulWidget> createState() {
    return QuestionCardState();
  }

}

class QuestionCardState extends State<QuestionCard> {
  TextStyle textStyle = TextStyle(color: Colors.white, letterSpacing: 3.0, decoration: TextDecoration.none, fontSize: 30);
  //  int get _index => QuizState().questions.indexOf(this.widget.question);


  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.lightBlue,
      child: Column(children: <Widget>[
        Text("Question ${widget.index}", style: textStyle),
        
      ],)

    );
  }
}