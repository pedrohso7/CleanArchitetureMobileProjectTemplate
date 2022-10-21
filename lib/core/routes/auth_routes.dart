import 'package:clean_architeture_project/features/authentication/auth_bindings.dart';
import 'package:clean_architeture_project/features/authentication/presenter/login/login_bindings.dart';
import 'package:clean_architeture_project/features/authentication/presenter/login/login_page.dart';
import 'package:clean_architeture_project/features/authentication/presenter/register/register_bindings.dart';
import 'package:clean_architeture_project/features/authentication/presenter/register/register_page.dart';
import 'package:get/get.dart';

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
