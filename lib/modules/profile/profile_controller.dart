import 'package:get/get.dart';

import '../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../core/utils/preference_constant.dart';
import '../../core/widget/snacbar_message.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/user_repository.dart';
import '../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final userRepository = Get.find<UserRepository>();

  var isLoading = true.obs;
  var user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getHome();
  }

  Future<void> getHome() async {
    isLoading(true);
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await userRepository.profile(userToken ?? ''); 
    if (response!.status == 'success') {
      user.value = response.data!;
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Username / Password salah',
      );
    }

    isLoading(false);
  }

  Future<void> logout() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await userRepository.logout(userToken ?? '');
    if (response!.status == 'success') {
      secureStorage.removeValue(key: USER_TOKEN);
      Get.offAllNamed(AppRoutes.LOGIN);
      Snackbarmessage.instance.showSuccessSnackbar(
        title: 'Berhasil',
        message: response.message ?? 'Logout berhasil',
      );
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Logout Gagal',
      );
    }

    isLoading(false);
  }
}
