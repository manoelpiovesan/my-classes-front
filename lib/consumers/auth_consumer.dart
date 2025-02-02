import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_classes_front/models/user.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:my_classes_front/utils/session.dart';
import 'package:my_classes_front/views/login.dart';

///
///
///
class AuthConsumer {
  ///
  ///
  ///
  Future<void> login(final LoginCredentials loginCredentials) async {
    try {
      final http.Response response = await http.post(
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        Uri.parse(<String>[Config().backUrl, 'auth', 'login'].join('/')),
        body: jsonEncode(loginCredentials.toJson()),
      );

      print(response.body);

      if (response.statusCode < 200 || response.statusCode > 299) {
        throw Exception('Failed to login: ${response.body}');
      }

      final Map<String, dynamic> json = jsonDecode(response.body);

      Session().token = json['token'];
      Session().user = User.fromJson(json['user']);
    } catch (e) {
      print(e);
    }
  }
}
