import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/routes/abstract_route.dart';
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
          builder: (final BuildContext context, final GoRouterState state) {
            if (kDebugMode) {
              print('Navigating to: ${state.uri}');
            }
            return const CourseList();
          },
        ),
      ];
}
