import 'package:answer_me_app/features/home/home_bindings.dart';
import 'package:answer_me_app/features/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeRoutes {
  HomeRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
