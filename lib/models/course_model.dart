import 'package:my_classes_front/models/abstract_model.dart';

///
///
///
class CourseModel extends AbstractModel {
  String name = '';
  String description = '';

  ///
  ///
  ///
  CourseModel();

  ///
  ///
  ///
  CourseModel.fromJson(final Map<String, dynamic> map) : super.fromJson(map) {
    name = map['name'];
    description = map['description'];
  }

  ///
  ///
  ///
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = super.toMap();
    map['name'] = name;
    map['description'] = description;
    return map;
  }
}
