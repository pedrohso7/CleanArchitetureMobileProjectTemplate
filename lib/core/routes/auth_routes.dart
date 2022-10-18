import 'package:answer_me_app/features/authentication/presenter/login/login_bindings.dart';
import 'package:get/get.dart';

import '../../features/authentication/auth_bindings.dart';
import '../../features/authentication/presenter/login/presentation/login_page.dart';
import '../../features/authentication/presenter/register/presentation/register_bindings.dart';
import '../../features/authentication/presenter/register/presentation/register_page.dart';

class AuthRoutes {
  AuthRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      bindings: [
        AuthBindings(),
        LoginBindings(),
      ],
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      bindings: [
        AuthBindings(),
        RegisterBindings(),
      ],
      page: () => const RegisterPage(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
