import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:my_classes_front/utils/session.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.school,
                  size: 100,
                  color: Colors.white,
                ),
                Text(Config().appName),

                if(Session().isLogged)
                  Text(Session().user!.firstName)
                else
                  const Text('Não logado'),
              ],
            ),
          ),

          /// Home
          ListTile(
            title: const Text('Página Inicial'),
            leading: const Icon(Icons.home),
            onTap: () => GoRouter.of(context).goNamed('home'),
          ),

          /// Login
          if(!Session().isLogged)
            ListTile(
              title: const Text('Login'),
              leading: const Icon(Icons.login),
              onTap: () => GoRouter.of(context).goNamed('login'),
            ),
        ],
      ),
    );
  }
}
