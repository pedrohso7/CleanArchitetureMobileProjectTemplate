import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';

import '../core/constants/routes/routes.dart';
import '../core/platform/firebase_client.dart';
import 'auth/auth_module.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  // Injeções globais
  @override
  void binds(i) {
    i.addLazySingleton<IFirebaseClient>(() => FirebaseClient());
    i.addLazySingleton(() => GetStorage());
  }

  // Rotas
  @override
  void routes(r) {
    r.module(AppRoutesNames.auth, module: AuthModule());
    r.module(AppRoutesNames.home, module: HomeModule());
  }
}
