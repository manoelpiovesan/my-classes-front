import 'package:flutter/material.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:my_classes_front/views/widgets/mc_drawer.dart';

///
///
///
class McScaffold extends StatefulWidget {
  final Widget? body;
  final String? title;

  ///
  ///
  ///
  const McScaffold({
    super.key,
    this.body,
    this.title,
  });

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
        elevation: 0,
        title: Text(widget.title ?? Config().appName),
      ),
      drawer: const McDrawer(),
      body: widget.body,
    );
  }
}
