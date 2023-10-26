import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/constants/routes/routes.dart';
import '../../core/platform/firebase_client.dart';
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
      () => AuthLocalDataSource(Modular.get<GetStorage>()),
    );
    i.addLazySingleton<AuthRemoteDataSourceInterface>(
      () => AuthRemoteDataSource(Modular.get<IFirebaseClient>()),
    );

    //Repositories
    i.addLazySingleton<AuthProtocols>(
      () => AuthRepository(
        Modular.get<AuthRemoteDataSourceInterface>(),
        Modular.get<AuthLocalDataSourceInterface>(),
      ),
    );

    //UseCases
    i.addLazySingleton(
      () => Login(Modular.get<AuthProtocols>()),
    );
    i.addLazySingleton(
      () => Register(Modular.get<AuthProtocols>()),
    );
    i.addLazySingleton(
      () => SendResetPasswordEmail(Modular.get<AuthProtocols>()),
    );
    i.addLazySingleton(
      () => WriteStringOnLocalStorage(Modular.get<AuthProtocols>()),
    );
    i.addLazySingleton(
      () => WriteUserOnLocalStorage(Modular.get<AuthProtocols>()),
    );

    //BLoC's
    i.addLazySingleton(
      () => LoginBloc(
        Modular.get<Login>(),
        Modular.get<WriteStringOnLocalStorage>(),
        Modular.get<WriteUserOnLocalStorage>(),
      ),
    );
    i.addLazySingleton(
      () => RegisterBloc(
        Modular.get<Register>(),
        Modular.get<WriteStringOnLocalStorage>(),
        Modular.get<WriteUserOnLocalStorage>(),
      ),
    );
    i.addLazySingleton(
      () => RetrieveAccountBloc(
        Modular.get<SendResetPasswordEmail>(),
      ),
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
