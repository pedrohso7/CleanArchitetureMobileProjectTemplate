import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/sizes.dart';
import '../../../../core/constants/theme/text_style.dart';
import 'bloc/retrieve_account_bloc.dart';
import 'screens/retrieve_account_screen.dart';

class RetrieveAccountPresenter extends StatefulWidget {
  const RetrieveAccountPresenter({super.key});

  @override
  State<RetrieveAccountPresenter> createState() => _RetrieveAccountPresenter();
}

class _RetrieveAccountPresenter extends State<RetrieveAccountPresenter> {
  late RetrieveAccountBloc bloc;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bloc = RetrieveAccountBloc.get(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _onPressRetrieveAccountButton(context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      bloc.add(RetrieveAccountRequestEvent(
        emailController.text,
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
        child: BlocBuilder<RetrieveAccountBloc, RetrieveAccountState>(
          builder: (context, state) {
            if (state is RetrieveAccountDefault) {
              return RetrieveAccountScreen(
                formKey: formKey,
                emailController: emailController,
                onPressButton: () => _onPressRetrieveAccountButton(context),
                onPressBackButton: onPressBack,
              );
            }
            if (state is RetrieveAccountLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RetrieveAccountError) {
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
