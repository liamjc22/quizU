import 'package:tutorial/models/question.dart';

class QuizState {

  static final QuizState _singleton = new QuizState._internal();
  final List<Question> _questions = new List();

  factory QuizState() {
    return _singleton;
  }

  QuizState._internal();

  List<Question> get questions => _questions;

}