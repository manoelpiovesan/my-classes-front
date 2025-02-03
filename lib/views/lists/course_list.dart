import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/consumers/course_consumer.dart';
import 'package:my_classes_front/models/course_model.dart';
import 'package:my_classes_front/views/mc_loading.dart';
import 'package:my_classes_front/views/mc_no_data.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

///
///
///
class _CourseListState extends State<CourseList> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<List<CourseModel>?>(
      future: CourseConsumer().list(),
      builder: (
        final BuildContext context,
        final AsyncSnapshot<List<CourseModel>?> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const McLoading(message: 'Carregando Cursos');
        }

        if (!snapshot.hasData) {
          return const McNoData(message: 'Nenhum Curso Encontrado');
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (
            final BuildContext context,
            final int index,
          ) {
            final CourseModel course = snapshot.data![index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                onTap: () => GoRouter.of(context).goNamed(
                  'courseDetails',
                  pathParameters: <String, String>{
                    'id': course.id.toString(),
                  },
                ),
                title: Text(course.name),
                subtitle: Text(course.description),
                leading: const Icon(Icons.school),
              ),
            );
          },
        );
      },
    );
  }
}
