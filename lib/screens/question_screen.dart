import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/models/question_model.dart';
import 'package:kuisku/providers/question_provider.dart';
import 'package:kuisku/widgets/root_scaffold.dart';
import 'package:kuisku/widgets/question_card.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    final horizontalPadding = screenWidth * 0.05;

    final verticalPadding = orientation == Orientation.portrait
        ? screenHeight * 0.04
        : screenHeight * 0.085;

    final QuestionProvider questionProvider = context.watch<QuestionProvider>();
    final List<Question> questions = questionProvider.questions;

    if (questions.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return RootScaffold(
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(screenWidth * 0.065, screenWidth * 0.065),
            backgroundColor: Colors.white,
            shape: CircleBorder(),
          ),
          child: Image.asset('assets/images/moon.png'),
        ),
      ],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: QuestionCard(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            orientation: orientation,
            questionProvider: questionProvider,
            questions: questions,
          ),
        ),
      ),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      orientation: orientation,
    );
  }
}
