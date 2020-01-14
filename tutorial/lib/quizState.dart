import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/models/question.dart';

String serialize(List<Question> questions) {
  List<dynamic> list = [];
  for (Question question in questions) {
    Map<String, dynamic> map = {
      "question": question.question,
      "answer": question.answer,
      "answers": question.answers
    };
    list.add(map);
  }
  String string = jsonEncode(list);
  return string;
}

List<Question> decode(String encodedString) {
  List<Question> questions = [];
  List<dynamic> maps = jsonDecode(encodedString);

  for (dynamic map in maps) {
    Question question = new Question();
    question.answer = map["answer"];
    question.answers = map["answers"];
    question.question = map["question"];
    questions.add(question);
  }

  return questions;
}


class QuizState {

  static final QuizState _singleton = new QuizState._internal();
  List<Question> _questions = [];

  factory QuizState() {
    return _singleton;
  }

  QuizState._internal() {
    _loadState();
  }

  List<Question> get questions => _questions;


  void saveState() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'questions';
    final value = serialize(questions);
    prefs.setString(key, value);
    print('saved $value');
  }
  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'questions';
    final String value = prefs.getString(key);
    print('loaded $value');

    if (value != null)
      _questions = decode(value);

  }


}

