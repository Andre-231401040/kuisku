import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:kuisku/providers/user_provider.dart';
import 'package:kuisku/widgets/root_scaffold.dart';

class NameInputScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    final double horizontalPadding = screenWidth * 0.05;

    final double verticalPadding = orientation == Orientation.portrait
        ? screenHeight * 0.025
        : screenHeight * 0.05;

    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    final double body = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

    return RootScaffold(
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
              mainAxisAlignment: orientation == Orientation.landscape
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukkan nama Anda',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: heading3,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.025
                      : screenHeight * 0.05,
                ),

                TextField(
                  controller: _textController,
                  style: TextStyle(fontSize: body),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: orientation == Orientation.portrait
                          ? screenHeight * 0.022
                          : screenHeight * 0.065,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.03),
                      ),
                      borderSide: BorderSide(
                        width: screenWidth * 0.0045,
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.03),
                      ),
                      borderSide: BorderSide(
                        width: screenWidth * 0.0045,
                        color: Color(0xFF3A86FF),
                      ),
                    ),
                    hintText: 'mis. Andre',
                    hintStyle: TextStyle(
                      color: Color(0xFFD6D6D6),
                      fontSize: body,
                    ),
                  ),
                ),

                SizedBox(
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.035
                      : screenHeight * 0.07,
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
                      context.read<UserProvider>().setName(
                        _textController.text,
                      );
                      context.go('/questions');
                    },
                    child: Text(
                      'Mulai Kuis',
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
          ),
        ),
      ),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      orientation: orientation,
    );
  }
}
