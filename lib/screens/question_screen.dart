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

    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    final double body = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

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
            fixedSize: Size(42, 42),
            backgroundColor: Colors.white,
            shape: CircleBorder(),
          ),
          child: Image.asset('assets/images/moon.png'),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: QuestionCard(
            heading3: heading3,
            body: body,
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
