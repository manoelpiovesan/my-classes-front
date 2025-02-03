import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_classes_front/models/course_model.dart';
import 'package:my_classes_front/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class CourseConsumer {
  ///
  ///
  /// List all courses from the User.
  Future<List<CourseModel>?> list() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final http.Response response = await http.get(
      Uri.parse(<String>[Config().backUrl, 'courses'].join('/')),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}',
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      return null;
    }

    final List<dynamic> json = jsonDecode(response.body);

    return json
        .map((final dynamic json) => CourseModel.fromJson(json))
        .toList();
  }

  ///
  ///
  /// Get a course by its ID.
  Future<CourseModel?> getById(final int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final http.Response response = await http.get(
      Uri.parse(<String>[Config().backUrl, 'courses', id.toString()].join('/')),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}',
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      return null;
    }

    final Map<String, dynamic> json = jsonDecode(response.body);

    return CourseModel.fromJson(json);
  }
}
