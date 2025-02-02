import 'package:flutter/material.dart';
import 'package:my_classes_front/utils/config.dart';

///
///
///
class McScaffold extends StatefulWidget {
  final Widget? body;

  const McScaffold({super.key, this.body});

  ///
  ///
  ///
  @override
  State<McScaffold> createState() => _McScaffoldState();
}

///
///
///
class _McScaffoldState extends State<McScaffold> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config().appName),
      ),
      body: widget.body,
    );
  }
}
