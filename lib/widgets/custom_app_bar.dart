import 'package:flutter/material.dart';

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

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: Color(0xFFF9FAFB),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/brain.png'),

                SizedBox(width: 7.0),

                Text(
                  'KuisKu',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
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
