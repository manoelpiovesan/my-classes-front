import 'package:my_classes_front/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class Utils {
  ///
  ///
  ///
  Future<void> loadUserIntoStorage(
    final UserModel? user,
    final String? token,
  ) async {
    if (user == null || token == null) {
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('userId', user.id!);
    await prefs.setString('userFirstName', user.firstName);
    await prefs.setString('userLastName', user.lastName);
    await prefs.setString('userEmail', user.email);
    await prefs.setString('userUsername', user.username);
    await prefs.setString('userRole', user.role.toString());
    await prefs.setString('token', token);
  }
}
