import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String idToken;
  final String refreshToken;
  final String expiresIn;

  const Token({
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  List<Object> get props => [idToken, refreshToken, expiresIn];
}

class User extends Equatable {
  final String localId;
  final String name;
  final String email;
  final Token token;

  const User({
    required this.localId,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  List<Object> get props => [localId, name, email, token];
}
