import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/sizes.dart';
import '../../../../core/constants/theme/text_style.dart';
import 'bloc/register_bloc.dart';
import 'screens/register_screen.dart';

class RegisterPresenter extends StatefulWidget {
  const RegisterPresenter({super.key});

  @override
  State<RegisterPresenter> createState() => _RegisterPresenter();
}

class _RegisterPresenter extends State<RegisterPresenter> {
  late RegisterBloc bloc;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bloc = RegisterBloc.get(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  void _onPressRegisterButton(context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      bloc.add(RegisterRequestEvent(
        nameController.text,
        emailController.text,
        passwordController.text,
      ));
    }
  }

  void onPressBack() => Modular.to.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s40,
        ),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterDefault) {
              return RegisterScreen(
                formKey: formKey,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                passwordConfirmationController: passwordConfirmationController,
                onPressButton: () => _onPressRegisterButton(context),
                onPressBackButton: onPressBack,
              );
            }
            if (state is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RegisterError) {
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
      ),
    );
  }
}
