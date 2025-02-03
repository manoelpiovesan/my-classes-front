import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/consumers/auth_consumer.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  ///
  ///
  ///
  @override
  State<LoginView> createState() => _LoginViewState();
}

///
///
///
class _LoginViewState extends State<LoginView> {
  final LoginCredentials _loginCredentials = LoginCredentials(
    email: 'string',
    password: 'string',
  );

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return McScaffold(
      body: Center(
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (
            final BuildContext context,
            final AsyncSnapshot<SharedPreferences> snapshot,
          ) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            /// If the user is already logged in, show the logout button.
            if (snapshot.data!.getString('token') != null) {
              return Center(
                child: TextButton.icon(
                  onPressed: () => setState(() {
                    AuthConsumer().logout();
                  }),
                  label: const Text('Logout'),
                  icon: const Icon(Icons.logout),
                ),
              );
            }

            return Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 24,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    spacing: 18,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /// E-mail
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        onChanged: (final String value) =>
                            _loginCredentials.email = value,
                      ),

                      /// Password
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        onChanged: (final String value) =>
                            _loginCredentials.password = value,
                      ),

                      /// Login Button
                      ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            await AuthConsumer().login(_loginCredentials);
                            if (context.mounted) {
                              GoRouter.of(context).goNamed('home');
                            }
                          } on Exception catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Falha ao logar: $e'),
                                ),
                              );
                            }
                          }
                        },
                        label: const Text('Entrar'),
                        icon: const Icon(Icons.login),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///
///
///
class LoginCredentials {
  String email = '';
  String password = '';

  LoginCredentials({
    this.email = '',
    this.password = '',
  });

  ///
  ///
  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
