import 'package:answer_me_app/features/authentication/login/presentation/login_bindings.dart';
import 'package:answer_me_app/features/authentication/login/presentation/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AuthRoutes {
  AuthRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    // GetPage(
    //   name: 'auth/register',
    //   binding: RegisterBindings(),
    //   page: () => const RegisterPage(),
    //   transition: Transition.downToUp,
    //   transitionDuration: const Duration(milliseconds: 200),
    // ),
  ];
}
