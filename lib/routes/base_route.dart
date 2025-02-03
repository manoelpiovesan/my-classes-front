import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/routes/course_route.dart';
import 'package:my_classes_front/views/home.dart';
import 'package:my_classes_front/views/login.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class BaseRoute {
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  ///
  ///
  ///
  GoRouter get routes => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/login',
        routes: <RouteBase>[
          /// Shell
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (
              final BuildContext context,
              final GoRouterState state,
              final Widget child,
            ) {
              return McScaffold(
                body: child,
                key: state.pageKey,
              );
            },
            routes: <RouteBase>[
              /// Home
              GoRoute(
                name: 'home',
                path: '/',
                pageBuilder:
                    (final BuildContext context, final GoRouterState state) {
                  return NoTransitionPage<Home>(
                    child: Home(
                      key: state.pageKey,
                    ),
                  );
                },
              ),

              /// Login
              GoRoute(
                path: '/login',
                name: 'login',
                pageBuilder:
                    (final BuildContext context, final GoRouterState state) {
                  if (kDebugMode) {
                    print('Navigating to: ${state.uri}');
                  }
                  return NoTransitionPage<LoginView>(
                    child: LoginView(
                      key: state.pageKey,
                    ),
                  );
                },
              ),

              /// Course
              ...CourseRoute().routes,
            ],
          ),
        ],
      );
}
