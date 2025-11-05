import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/models/question_model.dart';
import 'package:kuisku/providers/question_provider.dart';

class QuestionCard extends StatefulWidget {
  final double heading3;
  final double body;
  final QuestionProvider questionProvider;
  final List<Question> questions;

  const QuestionCard({
    super.key,
    required this.heading3,
    required this.body,
    required this.questionProvider,
    required this.questions,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final int currentIndex = widget.questionProvider.currentIndex;
    final Question currentQuestion = widget.questions[currentIndex];

    _selectedAnswer = context
        .watch<QuestionProvider>()
        .userAnswers[currentIndex];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          return;
        }
        widget.questionProvider.previousQuestion();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value:
                widget.questionProvider.userAnswers
                    .where((answer) => answer != null)
                    .length /
                widget.questions.length,
            backgroundColor: Colors.grey[300],
            color: Color(0XFF3A86FF),
            minHeight: 20,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),

          SizedBox(height: 28),

          Text(
            'Pertanyaan ${currentQuestion.number}',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: widget.heading3,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 20),

          Text(
            currentQuestion.question,
            style: TextStyle(fontSize: widget.body),
          ),

          SizedBox(height: 16),

          RadioGroup(
            groupValue: _selectedAnswer,
            onChanged: (String? value) {
              setState(() {
                widget.questionProvider.setUserAnswer(currentIndex, value);
              });
            },
            child: Column(
              children: [
                ...currentQuestion.options.map(
                  (option) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: _selectedAnswer == option
                              ? Color(0XFF3A86FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Radio(value: option, activeColor: Colors.white),

                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: _selectedAnswer == option
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: widget.body,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Color(0xFF3A86FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              onPressed: () {
                widget.questionProvider.nextQuestion();
              },
              child: Text(
                currentIndex == widget.questions.length - 1
                    ? 'Selesai'
                    : 'Lanjut',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: widget.heading3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
