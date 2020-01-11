import 'package:flutter/material.dart';
import 'package:tutorial/models/question.dart';
import 'package:tutorial/quizState.dart';
import 'package:tutorial/views/scorePage.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> list = QuizState().questions;
  @override
  _QuestionPageState createState() => _QuestionPageState(list);
}

class _QuestionPageState extends State<QuestionPage> {
  final List<Question> questions; //list of questions
  int index = 0; //current question
  int chosen; //index of answer chosen
  double score = 0; //answers correct
  bool showOverlay = false; //hide or display overlay
  bool correct; //whether the answer is correct

  _QuestionPageState(this.questions); //constructor

  final TextStyle textStyle = TextStyle(
      color: Colors.white, letterSpacing: 6.0, decoration: TextDecoration.none);

  void goHome() {
    //return to start screen
    Navigator.pop(context);
  }

  void checkIndex() {
    //hide or show overlay
    this.setState(() {
      showOverlay = false;
    });
    if (index < questions.length - 1)
      this.setState(() {
        index++;
      });
    else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScorePage(score / questions.length)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            goHome();
          },
        ),
        title: Text(
            "Question " + index.toString() + "/" + questions.length.toString()),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              color: Colors.lightBlue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //question
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        questions[index].question,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    //answers
                    FlatButton(
                      child: Text(questions[index].answers[0]),
                      onPressed: () {
                        this.setState(() {
                          chosen = 0;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(questions[index].answers[1]),
                      onPressed: () {
                        this.setState(() {
                          chosen = 1;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(questions[index].answers[2]),
                      onPressed: () {
                        this.setState(() {
                          chosen = 2;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(questions[index].answers[3]),
                      onPressed: () {
                        this.setState(() {
                          chosen = 3;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (chosen == questions[index].answer) {
                            //correct answer
                            this.setState(() {
                              score = score + 1;
                              correct = true;
                              showOverlay = true;
                            });
                          } else {
                            //incorrect answer
                            this.setState(() {
                              correct = false;
                              showOverlay = true;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              )),
          showOverlay == true
              ? new Overlay(
                  correct: this.correct,
                  onPressed: checkIndex,
                )
              : Container(),
        ],
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  final bool correct;
  final Function onPressed;
  const Overlay({
    Key key,
    this.correct,
    this.onPressed,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
          onTap: () {
            //hides overlay
            this.onPressed();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    correct == true ? Icons.done : Icons.clear,
                    size: 80,
                  )),
              Text(
                correct == true ? "Correct!" : "Wrong!",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          )),
    );
  }
}
