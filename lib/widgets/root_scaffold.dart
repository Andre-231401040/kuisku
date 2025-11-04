import 'package:flutter/material.dart';

class RootScaffold extends StatelessWidget {
  final Widget? titleWidget;
  final Widget body;
  final double screenWidth;
  final double screenHeight;

  const RootScaffold({
    super.key,
    this.titleWidget,
    required this.body,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = screenWidth * 0.05;
    final verticalPadding = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: titleWidget,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: body,
      ),
    );
  }
}
