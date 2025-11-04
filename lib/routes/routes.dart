import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuisku/screens/splash_screen.dart';
import 'package:kuisku/screens/name_input_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/input_name',
      builder: (BuildContext context, GoRouterState state) {
        return const NameInputScreen();
      },
    ),
  ],
);
