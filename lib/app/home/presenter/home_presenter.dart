import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/sizes.dart';
import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/widgets/default_appbar.dart';
import 'bloc/home_bloc.dart';
import 'screens/home_screen.dart';

class HomePresenter extends StatefulWidget {
  const HomePresenter({super.key});

  @override
  State<HomePresenter> createState() => _HomePresenter();
}

class _HomePresenter extends State<HomePresenter> {
  late HomeBloc bloc;
  @override
  void initState() {
    bloc = HomeBloc.get(context);
    super.initState();
  }

  void _logout() => bloc.add(LogoutEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Onboard',
        withBackButton: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeDefault) {
              return HomeScreen(onPressLogoutButton: _logout);
            }
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeError) {
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
