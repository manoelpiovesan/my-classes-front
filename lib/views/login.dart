import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_classes_front/consumers/auth_consumer.dart';
import 'package:my_classes_front/views/mc_scaffold.dart';

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
  final LoginCredentials _loginCredentials = LoginCredentials();

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return McScaffold(
      body: Center(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
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
                ElevatedButton(
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
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

///
///
///
class LoginCredentials {
  String email = '';
  String password = '';

  LoginCredentials();

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
