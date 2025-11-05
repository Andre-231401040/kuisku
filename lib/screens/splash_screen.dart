import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.go('/input_name');
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    final double heading1 = orientation == Orientation.portrait
        ? screenWidth * 0.15
        : screenHeight * 0.15;

    final double body = orientation == Orientation.portrait
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
                  fontSize: heading1,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                'Kuis seru, pengetahuan baru!',
                style: TextStyle(color: Colors.black, fontSize: body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
