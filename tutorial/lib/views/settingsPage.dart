import 'package:flutter/material.dart';
import 'package:tutorial/models/question.dart';
import 'package:tutorial/quizState.dart';
import 'package:tutorial/views/questionCard.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  //quiz state
  QuizState quizState = QuizState();

  //functions
  void _backButtonPressed() {
    Navigator.pop(context);
  }

  void _newQuestion() {
    setState(() {
      quizState.questions.add(new Question());
    });
  }

  Widget _getQuestions() {
    return ListView.builder(
        itemCount: quizState.questions.length,
        itemBuilder: (BuildContext context, int index) {
          return new QuestionCard(
              quizState.questions[index], index, () => setState(() {}));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Quiz"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _backButtonPressed(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _newQuestion,
      ),
      body: _getQuestions(),
    );
  }
}
