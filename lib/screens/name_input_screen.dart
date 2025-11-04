import 'package:flutter/material.dart';
import 'package:kuisku/widgets/root_scaffold.dart';

class NameInputScreen extends StatelessWidget {
  const NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    final double heading3 = orientation == Orientation.portrait
        ? screenWidth * 0.06
        : screenHeight * 0.06;

    final double body = orientation == Orientation.portrait
        ? screenWidth * 0.04
        : screenHeight * 0.04;

    return RootScaffold(
      titleWidget: Row(
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
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

              SizedBox(height: 28),

              TextField(
                style: TextStyle(fontSize: body),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      width: 2.0,
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

              SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Color(0xFF3A86FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                  onPressed: () {},
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
      screenWidth: screenWidth,
      screenHeight: screenHeight,
    );
  }
}
