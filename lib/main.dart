import 'package:flutter/material.dart';
import 'package:kuisku/routes/routes.dart';
// import 'package:kuisku/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Poppins'),
      routerConfig: router,
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
