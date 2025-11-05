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
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: CustomAppBar(
        actions: actions,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        orientation: orientation,
      ),
      body: body,
    );
  }
}
