class LocalStorageException implements Exception {
  final String message;

  LocalStorageException({this.message = 'Recurso não encontrado'});
}
