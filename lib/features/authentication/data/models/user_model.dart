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
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] ?? '',
      map['name'] ?? '',
      map['email'] ?? '',
      map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
