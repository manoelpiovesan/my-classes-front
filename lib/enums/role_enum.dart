import 'package:flutter/material.dart';

///
///
///
enum RoleEnum {
  teacher(Icons.school),
  student(Icons.book),
  unknown(Icons.person);

  final IconData iconData;

  ///
  ///
  ///
  const RoleEnum(this.iconData);

  ///
  ///
  ///
  static RoleEnum fromString(final String? role) {
    if (role == null) {
      return RoleEnum.unknown;
    }
    switch (role) {
      case 'teacher':
        return RoleEnum.teacher;
      case 'student':
        return RoleEnum.student;
      default:
        return RoleEnum.unknown;
    }
  }

  ///
  ///
  ///
  Icon get icon => Icon(iconData);
}
