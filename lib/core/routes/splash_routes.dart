import 'package:answer_me_app/features/splash/splash_bindings.dart';
import 'package:answer_me_app/features/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashRoutes {
  SplashRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/splash',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    ),
  ];
}
