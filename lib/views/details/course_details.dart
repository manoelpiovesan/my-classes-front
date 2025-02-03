import 'package:flutter/material.dart';
import 'package:my_classes_front/consumers/course_consumer.dart';
import 'package:my_classes_front/models/course_model.dart';
import 'package:my_classes_front/views/mc_loading.dart';
import 'package:my_classes_front/views/mc_no_data.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class CourseDetails extends StatefulWidget {
  final int id;

  const CourseDetails({required this.id, super.key});

  ///
  ///
  ///
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

///
///
///
class _CourseDetailsState extends State<CourseDetails> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<CourseModel?>(
      future: CourseConsumer().getById(widget.id),
      builder: (
        final BuildContext context,
        final AsyncSnapshot<CourseModel?> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const McLoading(message: 'Carregando Curso');
        }

        if (!snapshot.hasData) {
          return const McNoData(message: 'Curso não encontrado');
        }

        final CourseModel course = snapshot.data!;

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 8,
            children: <Widget>[
              Text(course.name),
              Text(course.description),
            ],
          ),
        );
      },
    );
  }
}
