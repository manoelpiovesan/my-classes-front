import 'package:flutter/material.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:my_classes_front/views/home.dart';

///
///
///
void main() {
  runApp(const MyClasses());
}

///
///
///
class MyClasses extends StatelessWidget {
  ///
  ///
  ///
  const MyClasses({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: Config().appName,
      theme: Config().themeData,
      home: const Home(),
    );
  }
}
