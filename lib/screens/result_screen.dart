import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/providers/user_provider.dart';
import 'package:kuisku/providers/question_provider.dart';
import 'package:kuisku/widgets/root_scaffold.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    final double heading2 = orientation == Orientation.portrait
        ? screenWidth * 0.08
        : screenHeight * 0.08;

    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    final double body = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

    final String? name = context.watch<UserProvider>().name;
    final int score = context.watch<QuestionProvider>().getScore();
    final int totalQuestion = context
        .watch<QuestionProvider>()
        .questions
        .length;

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Container(
              width: 200, // ganti dengan screenwidth
              height: 200, // ganti dengan screenwidth
              decoration: BoxDecoration(
                color: Color(0XFF3A86FF),
                borderRadius: BorderRadius.circular(
                  100,
                ), // nilai ganti dengan screenwidth
              ),
              child: Image.asset('assets/images/trophy.png'),
            ),

            SizedBox(),

            Text('Selamat, $name!'),

            SizedBox(),

            Text('Anda telah menyelesaikan kuis'),

            SizedBox(),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text('Skor Anda'),
                  Text('$score/$totalQuestion'),
                  LinearProgressIndicator(
                    value: score / totalQuestion,
                    backgroundColor: Colors.grey[300],
                    color: Color(0XFF3A86FF),
                    minHeight: 20,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ],
              ),
            ),

            SizedBox(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Color(0xFF3A86FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              onPressed: () {},
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/reload.png'),
                    Text('Coba Lagi'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      orientation: orientation,
    );
  }
}
