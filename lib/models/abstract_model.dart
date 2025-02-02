import 'package:flutter/cupertino.dart';

///
///
///
abstract class AbstractModel {
  int? id;

  ///
  ///
  ///
  AbstractModel({
    this.id,
  });

  ///
  ///
  ///
  AbstractModel.fromJson(final Map<String, dynamic> map) {
    id = map['id'];
  }

  ///
  ///
  ///
  @mustCallSuper
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
