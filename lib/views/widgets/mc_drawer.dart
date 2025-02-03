import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/consumers/auth_consumer.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (
        final BuildContext context,
        final AsyncSnapshot<SharedPreferences> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final bool isLoggedIn = snapshot.data!.getString('token') != null;

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Config().themeData.primaryColor,
                ),
                child: Text(
                  snapshot.data!.getString('token') != null
                      ? 'Olá, ${snapshot.data!.getString('userFirstName')}!'
                      : 'Bem vindo!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              /// Home button.
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  _navigate(context, 'home');
                },
              ),

              /// Courses button.
              if (isLoggedIn)
                ListTile(
                  title: const Text('Courses'),
                  leading: const Icon(Icons.school),
                  subtitle: const Text('Ver todos os cursos'),
                  onTap: () => _navigate(context, 'courseList'),
                ),

              /// Login and logout buttons.
              if (isLoggedIn)
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.logout),
                  onTap: () {
                    AuthConsumer().logout();
                    _navigate(context, 'home');
                  },
                )
              else
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Login'),
                  onTap: () => _navigate(context, 'login'),
                ),
            ],
          ),
        );
      },
    );
  }

  void _navigate(final BuildContext context, final String route) {
    context..pop()
    ..goNamed(route);

  }
}
