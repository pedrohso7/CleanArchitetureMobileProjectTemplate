class RemoteClientException implements Exception {
  final int? code;
  final String message;

  RemoteClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() {
    return 'code: $code, message: $message';
  }
}
