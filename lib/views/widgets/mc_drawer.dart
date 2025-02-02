import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/utils/config.dart';

///
///
///
class McDrawer extends StatelessWidget {
  const McDrawer({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          /// Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(Config().appName),
          ),

          /// Home
          ListTile(
            title: const Text('Página Inicial'),
            leading: const Icon(Icons.home),
            onTap: () => GoRouter.of(context).goNamed('home'),
          ),
        ],
      ),
    );
  }
}
