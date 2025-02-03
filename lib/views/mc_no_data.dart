import 'package:flutter/material.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

///
///
///
class McNoData extends StatelessWidget {
  final String? message;

  ///
  ///
  ///
  const McNoData({super.key, this.message});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return McScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.info,
              size: 100,
            ),
            Text(message ?? 'Nenhum Dado Encontrado'),
          ],
        ),
      ),
    );
  }
}
