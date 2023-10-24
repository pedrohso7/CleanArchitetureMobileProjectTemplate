import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/routes/routes.dart';
import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/text_style.dart';
import 'bloc/login_bloc.dart';
import 'screens/login_screen.dart';

class LoginPresenter extends StatefulWidget {
  const LoginPresenter({super.key});

  @override
  State<LoginPresenter> createState() => _LoginPresenter();
}

class _LoginPresenter extends State<LoginPresenter> {
  late LoginBloc bloc;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bloc = LoginBloc.get(context);
    Future.delayed(const Duration(milliseconds: 4000), () {
      bloc.add(StartFormAnimationEvent());
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      bloc.add(StartBackgroundAnimationEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onPressLoginButton(context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      bloc.add(LoginRequestEvent(
        emailController.text,
        passwordController.text,
      ));
    }
  }

  void _onPressRegisterButton() =>
      Modular.to.navigate(AppRoutesPaths.registerPath);

  void _onPressRetrieveAccountButton() =>
      Modular.to.navigate(AppRoutesPaths.retriveAccountPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginDefault) {
            return LoginScreen(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              onPressLoginButton: () => _onPressLoginButton(context),
              onPressRegisterButton: _onPressRegisterButton,
              onPressRetrieveAccountButton: _onPressRetrieveAccountButton,
              startBackgroundAnimation: state.isBackgroundAnimationStarted,
              startFormAnimation: state.isFormAnimationStarted,
            );
          }
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoginError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.subTitle,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
