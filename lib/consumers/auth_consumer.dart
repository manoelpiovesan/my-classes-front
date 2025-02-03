import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_classes_front/models/user_model.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:my_classes_front/utils/utils.dart';
import 'package:my_classes_front/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Uri.parse(<String>[Config().backUrl, 'auth', 'login'].join('/')),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginCredentials.toJson()),
      );

      if (response.statusCode < 200 || response.statusCode > 299) {
        throw Exception('Failed to login: ${response.body}');
      }

      final Map<String, dynamic> json = jsonDecode(response.body);

      await Utils().loadUserIntoStorage(
        UserModel.fromJson(json['user']),
        json['token'],
      );

      return;
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Failed to login: $e');
      }
    }

    return;
  }

  ///
  ///
  ///
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
