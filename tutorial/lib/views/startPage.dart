import 'package:flutter/material.dart';
import 'package:tutorial/quizState.dart';
import 'package:tutorial/views/questionPage.dart';
import 'package:tutorial/views/settingsPage.dart';

class StartPage extends StatelessWidget {
  //variables
  final String title;
  final String name;

  //styles
  final TextStyle titleStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 6.0,
      decoration: TextDecoration.none,
      fontSize: 60);
  final TextStyle textStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 4.0,
      decoration: TextDecoration.none,
      fontSize: 20);

  //constructor
  StartPage(this.title, this.name);

  //functions
  void editQuiz(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  void startQuiz(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuestionPage()));
  }

  Widget _getBody(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(title, style: titleStyle),
          Spacer(),
          RaisedButton(
            child: Text("Start"),
            onPressed: () {
              if (QuizState().questions.length > 0) {
                startQuiz(context);
              }
            },
          ),
          Spacer(),
          new Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://i.imgur.com/BoN9kdC.png")))),
          Spacer(),
          Text("Made By " + name, style: textStyle),
          Spacer(),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => editQuiz(context),
            )
          ],
        ),
        backgroundColor: Colors.lightBlue,
        body: _getBody(context));
  }
}
