import 'package:my_classes_front/models/user.dart';

///
///
///
class Session {
  String? token;
  User? user;

  bool get isLogged => token != null;

  /// --------------------
  factory Session() => _instance;

  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();
}
