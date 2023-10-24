part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterRequestEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  const RegisterRequestEvent(
    this.name,
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}
