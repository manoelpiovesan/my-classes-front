import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/routes/abstract_route.dart';
import 'package:my_classes_front/views/details/course_details.dart';
import 'package:my_classes_front/views/lists/course_list.dart';

///
///
///
class CourseRoute extends AbstractRoute {
  ///
  ///
  ///
  @override
  List<RouteBase> get routes => <RouteBase>[
        /// List
        GoRoute(
          name: 'courseList',
          path: '/courses',
          pageBuilder: (final BuildContext context, final GoRouterState state) {
            if (kDebugMode) {
              print('Navigating to: ${state.uri}');
            }
            return const NoTransitionPage<Widget>(child: CourseList());
          },
        ),

        /// Course Details
        GoRoute(
          name: 'courseDetails',
          path: '/courses/:id',
          pageBuilder: (final BuildContext context, final GoRouterState state) {
            if (kDebugMode) {
              print('Navigating to: ${state.uri}');
            }
            if (state.pathParameters['id'] == null) {
              return const NoTransitionPage<Widget>(child: CourseList());
            }
            final int id = int.parse(state.pathParameters['id']!);
            return NoTransitionPage<Widget>(child: CourseDetails(id: id));
          },
        ),
      ];
}
