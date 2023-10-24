part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginDefault extends LoginState {
  final bool isBackgroundAnimationStarted;
  final bool isFormAnimationStarted;
  const LoginDefault(
    this.isBackgroundAnimationStarted,
    this.isFormAnimationStarted,
  );

  @override
  List<Object> get props =>
      [isBackgroundAnimationStarted, isFormAnimationStarted];
}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
