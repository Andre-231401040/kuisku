import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final double screenWidth;
  final double screenHeight;
  final Orientation orientation;

  const CustomAppBar({
    super.key,
    this.actions,
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = screenWidth * 0.05;

    final verticalPadding = orientation == Orientation.portrait
        ? screenHeight * 0.01
        : screenHeight * 0.025;

    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: themeProvider.isDarkMode ? Color(0xFF0F172A) : Color(0xFFF9FAFB),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  themeProvider.isDarkMode
                      ? 'assets/images/brain_white.png'
                      : 'assets/images/brain_black.png',
                ),

                SizedBox(width: 7.0),

                Text(
                  'KuisKu',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: themeProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                    fontSize: heading3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            Row(children: actions ?? []),
          ],
        ),
      ),
    );
  }
}
