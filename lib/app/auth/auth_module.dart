import 'package:flutter_modular/flutter_modular.dart';
import '../../core/constants/routes/routes.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/protocols/auth_protocols.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/register.dart';
import 'domain/usecases/sent_reset_password_email.dart';
import 'domain/usecases/write_string_on_local_storage.dart';
import 'domain/usecases/write_user_on_local_storage.dart';
import 'presenter/login/bloc/login_bloc.dart';
import 'presenter/login/login_presenter.dart';
import 'presenter/register/bloc/register_bloc.dart';
import 'presenter/register/register_presenter.dart';
import 'presenter/retrieve_account/bloc/retrieve_account_bloc.dart';
import 'presenter/retrieve_account/retrieve_account_presenter.dart';

class AuthModule extends Module {
  // Aqui estarão quaisquer classes que você queira injetar dentro do seu projeto
  @override
  void binds(i) {
    //Data Sources
    i.addLazySingleton<AuthLocalDataSourceInterface>(
      () => AuthLocalDataSource(),
    );
    i.addLazySingleton<AuthRemoteDataSourceInterface>(
      () => AuthRemoteDataSource(),
    );

    //Repositories
    i.addLazySingleton<AuthProtocols>(
      () => AuthRepository(),
    );

    //UseCases
    i.addLazySingleton(
      () => Login(),
    );
    i.addLazySingleton(
      () => Register(),
    );
    i.addLazySingleton(
      () => SendResetPasswordEmail(),
    );
    i.addLazySingleton(
      () => WriteStringOnLocalStorage(),
    );
    i.addLazySingleton(
      () => WriteUserOnLocalStorage(),
    );

    //BLoC's
    i.addLazySingleton(
      () => LoginBloc(),
    );
    i.addLazySingleton(
      () => RegisterBloc(),
    );
    i.addLazySingleton(
      () => RetrieveAccountBloc(),
    );
  }

  // Aqui estarão as rotas do seu módulo
  @override
  void routes(r) {
    r.child(AppRoutesNames.register,
        child: (context) => const RegisterPresenter());
    r.child(AppRoutesNames.login, child: (context) => const LoginPresenter());
    r.child(AppRoutesNames.retrievePassword,
        child: (context) => const RetrieveAccountPresenter());
  }
}
