import 'package:awa/main.dart';
import 'package:awa/presentation/onboarding/page/main_video_start.dart';
import 'package:awa/presentation/onboarding/page/on_boarding_screen.dart';
import 'package:awa/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerPage = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'onBoarding',
          builder: (BuildContext context, GoRouterState state) {
            return OnBoardingScreen();
          },
        ),
        GoRoute(
          path: 'onMainStartBoarding',
          builder: (BuildContext context, GoRouterState state) {
            return MainVideoStartScreen();
          },
        ),
      ],
    ),
  ],
);