import 'package:flutter/material.dart';
import 'package:tutorial/models/question.dart';

import '../quizState.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final int index;
  final Function onDelete;
  QuestionCard(this.question, this.index, this.onDelete);

  @override
  State<StatefulWidget> createState() {
    return QuestionCardState(question.answer, question.question);
  }
}

class QuestionCardState extends State<QuestionCard> {
  TextStyle textStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 3.0,
      decoration: TextDecoration.none,
      fontSize: 30);
  int answer;
  TextEditingController questionController = TextEditingController();

  void _deleteQuestion() {
    QuizState().questions.remove(this.widget.question);
    this.widget.onDelete();
  }

  void _saveAnswer() {
    this.widget.question.answer = answer;
  }

  void _saveQuestion() {
    this.widget.question.question = questionController.text;
  }

  QuestionCardState(this.answer, String question) {
    questionController.text = question; 
    questionController.addListener(() {
        this.widget.question.question = questionController.text;
    });
  }

  List<Widget> _getChoices() {
    List<Widget> choices = [];
    for (int i = 0; i < 4; i++) {
      //when set state is called textfields would be reset if text editing cotrollers do not initiate with current value of questions answers
      TextEditingController controller =
          new TextEditingController(text: this.widget.question.answers[i]);
      controller.addListener(() {
        this.widget.question.answers[i] = controller.text;
      });

      Widget widget = RadioListTile<int>(
        title: TextField(
            maxLines: 2,
            decoration: InputDecoration.collapsed(hintText: "Enter Answer ${i + 1}"),
            controller: controller),
        value: i,
        groupValue: answer,
        onChanged: (int value) {
          setState(() {
            answer = value;
            _saveAnswer();
            _saveQuestion();
          });
        },
      );
      choices.add(widget);
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.delete), onPressed: _deleteQuestion),
                  Text("Question ${widget.index + 1}", style: textStyle),
                ],
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: "Enter Question Here"),
                controller: questionController,
              ),
              Column(
                children: _getChoices(),
              )
            ],
          ),
        ));
  }
}
