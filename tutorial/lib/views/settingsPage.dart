import 'package:flutter/material.dart';
import 'package:tutorial/models/question.dart';
import 'package:tutorial/quizState.dart';
import 'package:tutorial/views/questionCard.dart';

class SettingsPage extends StatefulWidget {
  
  TextStyle titleStyle = TextStyle(color: Colors.white, letterSpacing: 5.0, decoration: TextDecoration.none, fontSize: 50);

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  QuizState quizState = QuizState();

  void _backButtonPressed(BuildContext context){}
  void _newQuestion(){
    setState(() {
      quizState.questions.add(new Question());
    });
  }

  Widget _getQuestions(){

    return ListView.builder(
      itemCount: quizState.questions.length,
      itemBuilder: (BuildContext context, int index) {
        return new QuestionCard(quizState.questions[index], index, ()=>setState((){}));
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Quiz"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>_backButtonPressed(context),
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
