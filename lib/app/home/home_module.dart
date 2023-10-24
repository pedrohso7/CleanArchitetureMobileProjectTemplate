import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/home_local_datasource.dart';
import 'data/repositories/home_repository.dart';
import 'domain/protocols/home_protocols.dart';
import 'domain/usecases/remove_auth_cached_data.dart';
import 'presenter/bloc/home_bloc.dart';
import 'presenter/home_presenter.dart';

class HomeModule extends Module {
  // Aqui estarão quaisquer classes que você queira injetar dentro do seu módulo
  @override
  void binds(i) {
    //Data Sources
    i.addLazySingleton<HomeLocalDataSourceInterface>(
      () => HomeLocalDataSource(),
    );

    //Repositories
    i.addLazySingleton<HomeProtocols>(
      () => HomeRepository(),
    );

    //UseCases
    i.addLazySingleton(
      () => RemoveAuthCachedData(),
    );

    //BLoC's
    i.addLazySingleton(
      () => HomeBloc(),
    );
  }

  // Aqui estarão as rotas do seu módulo
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePresenter());
  }
}
