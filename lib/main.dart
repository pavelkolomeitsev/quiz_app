import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of maps
  final _questions = const [
    // first map
    {
      'questionText': 'What\`s your favorite color?',
      // key(String) - value(String)
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
      // key(String) - value(List of Maps)
    },
    // second map
    {
      'questionText': 'What\`s your favorite animal?',
      // key(String) - value(String)
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
      // key(String) - value(List of Maps)
    },
    // third map
    {
      'questionText': 'Who\`s your favorite actor?',
      // key(String) - value(String)
      'answers': [
        {'text': 'Arny Schwarzenegger', 'score': 10},
        {'text': 'Silv Stallone', 'score': 8},
        {'text': 'Bruce Willis', 'score': 7},
        {'text': 'Leo Di Caprio', 'score': 5}
      ],
      // key(String) - value(List of Strings)
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){

    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      ++_questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
