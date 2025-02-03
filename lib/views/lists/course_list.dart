import 'package:flutter/material.dart';
import 'package:my_classes_front/consumers/course_consumer.dart';
import 'package:my_classes_front/models/course_model.dart';
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
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return McScaffold(
          title: 'Meus Cursos',
          body: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (
              final BuildContext context,
              final int index,
            ) {
              final CourseModel course = snapshot.data![index];

              return ListTile(
                title: Text(course.name),
                subtitle: Text(course.description),
                leading: const Icon(Icons.school),
              );
            },
          ),
        );
      },
    );
  }
}
