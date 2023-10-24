part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterDefault extends RegisterState {
  const RegisterDefault();

  @override
  List<Object> get props => [];
}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}
