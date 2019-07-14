import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        // we take a list -> index -> every element is a map -> in this map we look for a key ['answers']
        // we say Dart: questions[_questionIndex]['answers'] it`s a list of Strings
        // because <Widget>[] is a list and questions is a list, it happens a nested list in the list
        // that`s why by operator (...) we extract values from the list 'questions'
        // and display them in the list <Widget>[]
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          // a method 'map' takes as a param every element (answer) in the list
          // and transform it into widget -> return Answer()
          // here we pass as an argument an anonymous function
          // and in this function we pass a pointer of the function answerQuestion with a param
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
