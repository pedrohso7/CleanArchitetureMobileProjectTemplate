import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:answer_me_app/shared/mixins/loading_mixin.dart';
import 'package:answer_me_app/shared/mixins/message_mixin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepositoryInterface _userRepository;

  SplashController({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2680), () async {
      if (await isUserLogged()) {
        await Get.toNamed('/home');
        return;
      }
      await Get.toNamed('/home');
    });
  }

  Future<bool> isUserLogged() async {
    final GetStorage storage = GetStorage();
    final String token = storage.read('token');
    final bool isUserTokenValid =
        await _userRepository.isUserTokenValid(token: token);
    return isUserTokenValid;
  }
}
