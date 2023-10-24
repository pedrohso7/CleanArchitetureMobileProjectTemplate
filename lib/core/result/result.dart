abstract class IResult<Type> {
  bool get isError;
  Type? get result;
  Exception? get error;
}

class SuccessResult<T> implements IResult<T> {
  final T data;

  SuccessResult(this.data);

  @override
  bool get isError => false;

  @override
  T get result => data;

  @override
  Exception? get error => null;
}

class ErrorResult<T> implements IResult<T> {
  final Exception exception;

  ErrorResult(this.exception);

  @override
  bool get isError => true;

  @override
  T? get result => null;

  @override
  Exception get error => exception;
}
