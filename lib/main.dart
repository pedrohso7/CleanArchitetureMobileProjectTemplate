import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app_module.dart';
import 'app/auth/presenter/login/bloc/login_bloc.dart';
import 'app/auth/presenter/register/bloc/register_bloc.dart';
import 'app/auth/presenter/retrieve_account/bloc/retrieve_account_bloc.dart';
import 'app/home/presenter/bloc/home_bloc.dart';
import 'core/constants/routes/routes.dart';
import 'core/mixins/user_decode_mixin.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await GetStorage.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with UserDecodeMixin {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
      checkIsUserLogged() ? AppRoutesPaths.homePath : AppRoutesPaths.loginPath,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Modular.get<LoginBloc>()),
        BlocProvider(create: (context) => Modular.get<RegisterBloc>()),
        BlocProvider(create: (context) => Modular.get<RetrieveAccountBloc>()),
        BlocProvider(create: (context) => Modular.get<HomeBloc>()),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        title: 'Translator-IA',
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
