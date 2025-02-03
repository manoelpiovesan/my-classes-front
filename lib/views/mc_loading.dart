import 'package:flutter/material.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class McLoading extends StatelessWidget {
  final String? message;

  ///
  ///
  ///
  const McLoading({super.key, this.message});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          Text(message ?? 'Carregando...'),
        ],
      ),
    );
  }
}
