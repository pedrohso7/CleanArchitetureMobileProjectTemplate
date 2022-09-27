import 'package:answer_me_app/shared/bindings/app_bindings.dart';
import 'package:answer_me_app/shared/routes/auth_routes.dart';
import 'package:answer_me_app/shared/routes/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'shared/themes/default_theme.dart';

void main() async {
  await Future.delayed(const Duration(milliseconds: 5000), () {
    debugPrint('teste');
  });

  await GetStorage.init();

  runApp(const AnswerMeApp());
}

class AnswerMeApp extends StatelessWidget {
  const AnswerMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AnswerMe',
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme.theme,
      initialBinding: AppBindings(),
      initialRoute: '/splash',
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
        ...SplashRoutes.routers,
      ],
    );
  }
}
