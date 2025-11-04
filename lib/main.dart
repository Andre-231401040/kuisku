import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/providers/user_provider.dart';
import 'package:kuisku/routes/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KuisKu',
      theme: ThemeData(fontFamily: 'Poppins'),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
