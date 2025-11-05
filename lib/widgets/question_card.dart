import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/models/question_model.dart';
import 'package:kuisku/providers/question_provider.dart';

class QuestionCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final Orientation orientation;
  final QuestionProvider questionProvider;
  final List<Question> questions;

  const QuestionCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation,
    required this.questionProvider,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    final double body = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

    final int currentIndex = questionProvider.currentIndex;
    final Question currentQuestion = questions[currentIndex];
    final String? selectedAnswer = context
        .watch<QuestionProvider>()
        .userAnswers[currentIndex];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          return;
        }
        questionProvider.previousQuestion();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value:
                questionProvider.userAnswers
                    .where((answer) => answer != null)
                    .length /
                questions.length,
            backgroundColor: Colors.grey[300],
            color: Color(0XFF3A86FF),
            minHeight: 24,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),

          SizedBox(
            height: orientation == Orientation.portrait
                ? screenHeight * 0.025
                : screenHeight * 0.05,
          ),

          Text(
            'Pertanyaan ${currentQuestion.number}',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: heading3,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(
            height: orientation == Orientation.portrait
                ? screenHeight * 0.015
                : screenHeight * 0.03,
          ),

          Text(currentQuestion.question, style: TextStyle(fontSize: body)),

          SizedBox(
            height: orientation == Orientation.portrait
                ? screenHeight * 0.02
                : screenHeight * 0.04,
          ),

          RadioGroup(
            groupValue: selectedAnswer,
            onChanged: (String? value) {
              questionProvider.setUserAnswer(currentIndex, value);
            },
            child: Column(
              children: [
                ...currentQuestion.options.map(
                  (option) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: selectedAnswer == option
                              ? Color(0XFF3A86FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.015,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio(value: option, activeColor: Colors.white),

                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: selectedAnswer == option
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: body,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? screenHeight * 0.02
                            : screenHeight * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: orientation == Orientation.portrait
                ? screenHeight * 0.02
                : screenHeight * 0.04,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(screenWidth * 0.03),
                backgroundColor: Color(0xFF3A86FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenWidth * 0.03),
                  ),
                ),
              ),
              onPressed: () {
                questionProvider.nextQuestion();
              },
              child: Text(
                currentIndex == questions.length - 1 ? 'Selesai' : 'Lanjut',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: heading3,
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
