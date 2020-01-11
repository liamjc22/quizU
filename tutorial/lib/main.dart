import 'package:flutter/material.dart';
import 'package:tutorial/views/questionPage.dart';
import 'package:tutorial/views/scorePage.dart';
import 'package:tutorial/views/settingsPage.dart';
import 'package:tutorial/views/startPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "Quizz U";
  final String name = "Carl Johnson";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new StartPage(title, name)
    );
  }
}
