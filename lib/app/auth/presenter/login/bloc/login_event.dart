part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends LoginEvent {
  final String email;
  final String password;
  const LoginRequestEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class StartBackgroundAnimationEvent extends LoginEvent {}

class StartFormAnimationEvent extends LoginEvent {}
