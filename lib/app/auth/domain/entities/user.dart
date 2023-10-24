abstract class Token {
  final String idToken;
  final String refreshToken;
  final String expiresIn;
  Token(
    this.idToken,
    this.refreshToken,
    this.expiresIn,
  );
}

abstract class User {
  final String localId;
  final String name;
  final String email;
  final Token token;

  User(
    this.localId,
    this.name,
    this.email,
    this.token,
  );
}
