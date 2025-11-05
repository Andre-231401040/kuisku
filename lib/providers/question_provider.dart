import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuisku/models/question_model.dart';

class QuestionProvider extends ChangeNotifier {
  int _currentIndex = 0;
  List<Question> _questions = [];
  List<String?> _userAnswers = [];

  QuestionProvider() {
    loadQuestions();
  }

  int get currentIndex => _currentIndex;

  List<Question> get questions => _questions;

  List<String?> get userAnswers => _userAnswers;

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString(
      'assets/data/questions.json',
    );
    final data = json.decode(response) as List<dynamic>;
    _questions = data.map((json) => Question.fromJson(json)).toList();

    _userAnswers = List<String?>.filled(_questions.length, null);

    notifyListeners();
  }

  String? getUserAnswer(int index) {
    if (index >= 0 && index < _userAnswers.length) {
      return _userAnswers[index];
    }
    return null;
  }

  void setUserAnswer(int index, String? answer) {
    if (index >= 0 && index < _userAnswers.length) {
      _userAnswers[index] = answer;
      notifyListeners();
    }
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] != null && _userAnswers[i] == _questions[i].answer) {
        score++;
      }
    }
    return score;
  }
}
