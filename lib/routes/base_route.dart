import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/views/home.dart';

///
///
///
class BaseRoute {
  final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      /// Home
      GoRoute(
        path: '/',
        name: 'home',
        builder: (final BuildContext context, final GoRouterState state) {
          if(kDebugMode) {
            print('Navigating to: ${state.uri}');
          }
          return const Home();
        },
      ),
    ],
  );
}
