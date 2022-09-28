import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String createdAt;

  UserModel(
    this.id,
    this.name,
    this.email,
    this.createdAt,
  );

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
