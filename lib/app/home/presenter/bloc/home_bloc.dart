import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../core/constants/routes/routes.dart';
import '../../domain/usecases/remove_auth_cached_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  final RemoveAuthCachedData _removeAuthCachedData;
  HomeBloc(this._removeAuthCachedData) : super(HomeDefault()) {
    on<HomeEvent>((event, emit) async {
      if (event is LogoutEvent) {
        _handleLogoutEvent(emit);
      }
    });
  }

  void _handleLogoutEvent(Emitter<HomeState> emit) async {
    _removeAuthCachedData(NoParams());
    emit(HomeDefault());
    Modular.to.navigate(AppRoutesPaths.loginPath);
  }
}
