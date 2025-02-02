import 'package:my_classes_front/enums/role_enum.dart';
import 'package:my_classes_front/models/abstract_model.dart';

///
///
///
class User extends AbstractModel {
  String firstName = '';
  String lastName = '';
  String email = '';
  String username = '';
  RoleEnum role = RoleEnum.unknown;

  ///
  ///
  ///
  User();

  ///
  ///
  ///
  User.fromJson(final Map<String, dynamic> map) : super.fromJson(map) {
    firstName = map['first_name'];
    lastName = map['last_name'];
    email = map['email'];
    username = map['username'];
    role = RoleEnum.fromString(map['role']);
  }

  ///
  ///
  ///
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = super.toMap();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    return map;
  }
}
