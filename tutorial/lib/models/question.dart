import 'dart:core';

class Question {
  Question(){
    question = "";
    answers = ["","","",""];
    answer=1;
  }
  String question;
  List<String> answers;
  int answer;
}