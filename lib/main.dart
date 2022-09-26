import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/login/presentation/login_controller.dart';
import 'package:answer_me_app/features/authentication/login/presentation/login_page.dart';
import 'package:answer_me_app/shared/bindings/app_bindings.dart';
import 'package:answer_me_app/shared/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'shared/themes/default_theme.dart';

void main() async {
  await Future.delayed(const Duration(milliseconds: 5000), () {
    debugPrint('teste');
  });
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AnswerMe',
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme.theme,
      // navigatorKey: TechfleetState.navigatorKey,
      initialBinding: AppBindings(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      getPages: [
        ...AuthRoutes.routers,
      ],
      home: const LoginPage(),
    );
  }
}
