import 'package:flutter/material.dart';
import 'package:my_classes_front/routes/base_route.dart';
import 'package:my_classes_front/utils/config.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Config().appName,
      theme: Config().themeData,
      routerConfig: BaseRoute().routes,
    );
  }
}
