import 'package:flutter/material.dart';
import 'package:kuisku/widgets/custom_app_bar.dart';

class RootScaffold extends StatelessWidget {
  final List<Widget>? actions;
  final Widget body;
  final double screenWidth;
  final double screenHeight;
  final Orientation orientation;

  const RootScaffold({
    super.key,
    this.actions,
    required this.body,
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = screenWidth * 0.05;
    final verticalPadding = orientation == Orientation.portrait
        ? screenHeight * 0.02
        : screenHeight * 0.085;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFF9FAFB),
      appBar: CustomAppBar(
        actions: actions,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        orientation: orientation,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: verticalPadding,
          bottom: horizontalPadding,
        ),
        child: body,
      ),
    );
  }
}
