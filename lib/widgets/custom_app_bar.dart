import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final double horizontalPadding;

  const CustomAppBar({
    super.key,
    this.actions,
    required this.horizontalPadding,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 16,
      ),
      color: Colors.red,
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
                    fontSize: 24, // ganti heading3 dengan angka
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
