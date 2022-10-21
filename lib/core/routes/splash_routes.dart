import 'package:clean_architeture_project/features/splash/presentation/splash_bindings.dart';
import 'package:clean_architeture_project/features/splash/presentation/splash_page.dart';
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
