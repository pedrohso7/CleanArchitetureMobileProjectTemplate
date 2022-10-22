import 'package:clean_architeture_project/core/bindings/app_bindings.dart';
import 'package:clean_architeture_project/core/routes/auth_routes.dart';
import 'package:clean_architeture_project/core/routes/home_routes.dart';
import 'package:clean_architeture_project/core/routes/splash_routes.dart';
import 'package:clean_architeture_project/core/themes/default_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  //Bindinds
  WidgetsFlutterBinding.ensureInitialized();

  //Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //Envinronment
  await dotenv.load(fileName: ".env");

  //Local Storage
  await GetStorage.init();

  //Execute
  runApp(const AnswerMeApp());

  //Initialize firebase services
  await Firebase.initializeApp();
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
        ...SplashRoutes.routers,
        ...HomeRoutes.routers,
        ...AuthRoutes.routers,
      ],
    );
  }
}
