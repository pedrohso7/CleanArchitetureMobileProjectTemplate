part of 'retrieve_account_bloc.dart';

sealed class RetrieveAccountState extends Equatable {
  const RetrieveAccountState();

  @override
  List<Object> get props => [];
}

final class RetrieveAccountDefault extends RetrieveAccountState {
  const RetrieveAccountDefault();

  @override
  List<Object> get props => [];
}

final class RetrieveAccountLoading extends RetrieveAccountState {}

final class RetrieveAccountError extends RetrieveAccountState {
  final String message;
  const RetrieveAccountError(this.message);

  @override
  List<Object> get props => [message];
}
