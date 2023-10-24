part of 'retrieve_account_bloc.dart';

sealed class RetrieveAccountEvent extends Equatable {
  const RetrieveAccountEvent();

  @override
  List<Object> get props => [];
}

class RetrieveAccountRequestEvent extends RetrieveAccountEvent {
  final String email;
  const RetrieveAccountRequestEvent(
    this.email,
  );

  @override
  List<Object> get props => [email];
}
