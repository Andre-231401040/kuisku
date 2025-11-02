import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    final double heading1Size = orientation == Orientation.portrait
        ? screenWidth * 0.15
        : screenHeight * 0.15;

    final double textSize = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

    return Material(
      child: Container(
        color: Color(0xFFF9FAFB),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KuisKu',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: heading1Size,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                'Kuis seru, pengetahuan baru!',
                style: TextStyle(color: Colors.black, fontSize: textSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
