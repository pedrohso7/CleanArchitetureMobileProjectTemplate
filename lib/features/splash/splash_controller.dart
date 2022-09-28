import 'package:answer_me_app/features/authentication/data/models/user_model.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:answer_me_app/shared/mixins/loading_mixin.dart';
import 'package:answer_me_app/shared/mixins/message_mixin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepositoryInterface _userRepository;

  SplashController({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository;

  void redirect() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (await isUserLogged()) {
        await Get.toNamed('/home');
        return;
      }
      await Get.toNamed('/auth/login');
    });
  }

  Future<bool> isUserLogged() async {
    final GetStorage storage = GetStorage();

    final String? token = storage.read('token');
    final Map? user = storage.read('user');

    if (token == null || user == null) return false;

    final UserModel userModel = UserModel.fromMap(user);

    final bool isUserTokenValid = await _userRepository.isUserTokenValid(
      token: token,
      userId: userModel.id,
    );

    return isUserTokenValid;
  }
}
