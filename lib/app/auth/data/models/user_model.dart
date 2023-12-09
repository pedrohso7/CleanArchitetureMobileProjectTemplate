import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
    final String localId,
    final String name,
    final String email,
    final Token token,
  ) : super(
          localId: localId,
          name: name,
          email: email,
          token: token,
        );

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'name': name,
      'email': email,
      'token': {
        'idToken': token.idToken,
        'refreshToken': token.refreshToken,
        'expiresIn': token.expiresIn,
      },
    };
  }

  factory UserModel.fromMap(Map? map) {
    final TokenModel token = map != null
        ? TokenModel(
            map['idToken'],
            map['refreshToken'],
            map['expiresIn'],
          )
        : const TokenModel(
            '',
            '',
            '',
          );
    if (map != null) {
      return UserModel(
        map['localId'],
        map['name'] ?? 'NomeQualquer',
        map['email'],
        token,
      );
    }
    return UserModel(
      '',
      '',
      '',
      token,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

class TokenModel extends Token {
  const TokenModel(
    final String idToken,
    final String refreshToken,
    final String expiresIn,
  ) : super(
          idToken: idToken,
          refreshToken: refreshToken,
          expiresIn: expiresIn,
        );

  Map<String, dynamic> toMap() {
    return {
      'idToken': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }

  factory TokenModel.fromMap(Map? map) {
    return TokenModel(
      map != null ? map['idToken'] : '',
      map != null ? map['refreshToken'] : '',
      map != null ? map['expiresIn'] : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));
}
