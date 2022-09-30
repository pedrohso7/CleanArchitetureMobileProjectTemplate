import 'dart:convert';

import 'package:answer_me_app/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
    String id,
    String name,
    String email,
    String createdAt,
  ) : super(id, name, email, createdAt);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map? map) {
    return UserModel(
      map != null ? map['_id'] : '',
      map != null ? map['name'] : '',
      map != null ? map['email'] : '',
      map != null ? map['createdAt'] : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
