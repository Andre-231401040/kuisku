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

    final horizontalPadding = screenWidth * 0.05;

    final verticalPadding = orientation == Orientation.portrait
        ? screenHeight * 0.025
        : screenHeight * 0.05;

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
            padding: EdgeInsets.all(
              orientation == Orientation.portrait
                  ? screenWidth * 0.03
                  : screenWidth * 0.02,
            ),
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
          child: Container(
            constraints: BoxConstraints(minHeight: screenHeight - 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: orientation == Orientation.portrait
                      ? screenWidth * 0.4
                      : screenHeight * 0.4,
                  height: orientation == Orientation.portrait
                      ? screenWidth * 0.4
                      : screenHeight * 0.4,
                  decoration: BoxDecoration(
                    color: Color(0XFF3A86FF),
                    borderRadius: BorderRadius.circular(
                      orientation == Orientation.portrait
                          ? screenWidth * 0.4
                          : screenHeight * 0.4,
                    ),
                  ),
                  child: Image.asset('assets/images/trophy.png'),
                ),

                SizedBox(
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.025
                      : screenHeight * 0.05,
                ),

                Text(
                  'Selamat, $name!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF3A86FF),
                    fontSize: heading3,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  'Anda telah menyelesaikan kuis',
                  style: TextStyle(fontSize: body),
                ),

                SizedBox(
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.025
                      : screenHeight * 0.05,
                ),

                Container(
                  padding: EdgeInsets.all(
                    orientation == Orientation.portrait
                        ? screenWidth * 0.065
                        : screenHeight * 0.065,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      orientation == Orientation.portrait
                          ? screenWidth * 0.015
                          : screenHeight * 0.015,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('Skor Anda', style: TextStyle(fontSize: body)),

                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? screenHeight * 0.005
                            : screenHeight * 0.01,
                      ),

                      Text(
                        '$score/$totalQuestion',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF3A86FF),
                          fontSize: heading2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? screenHeight * 0.005
                            : screenHeight * 0.01,
                      ),

                      LinearProgressIndicator(
                        value: score / totalQuestion,
                        backgroundColor: Colors.grey[300],
                        color: Color(0XFF3A86FF),
                        minHeight: 24,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.03
                      : screenHeight * 0.06,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(
                      orientation == Orientation.portrait
                          ? screenWidth * 0.045
                          : screenHeight * 0.045,
                    ),
                    backgroundColor: Color(0xFF3A86FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          orientation == Orientation.portrait
                              ? screenWidth * 0.045
                              : screenHeight * 0.045,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/reload.png'),

                      SizedBox(
                        width: orientation == Orientation.portrait
                            ? screenWidth * 0.04
                            : screenWidth * 0.02,
                      ),

                      Text(
                        'Coba Lagi',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: heading3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      orientation: orientation,
    );
  }
}
