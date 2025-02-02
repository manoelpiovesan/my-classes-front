import 'package:flutter/material.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class Home extends StatelessWidget {
  ///
  ///
  ///
  const Home({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return const McScaffold(
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
