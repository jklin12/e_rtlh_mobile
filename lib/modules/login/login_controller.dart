import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../core/utils/preference_constant.dart';
import '../../core/widget/snacbar_message.dart';
import '../../data/repository/auth_repository.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final authRepository = Get.find<AuthRepository>();
  final secureStorage = Get.find<SecureStorageManager>();

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;
  var isSecureText = true.obs;
  var isValidationError = false.obs;
  var isHasBackButton = false.obs; 

  final formKey = GlobalKey<FormState>();
 

  tooglePassword() {
    isSecureText(!isSecureText.value);
  }

  Future<void> login() async {
    isLoading(true);

    var response = await authRepository.login(
        usernameController.text, passwordController.text);

    if (response != null) { 
      if (response.status == 'success') {
        secureStorage.saveBool(key: USER_LOGIN_STATUS, value: true);
        secureStorage.saveString(
            key: USER_TOKEN, value: response.data!.authToken);
        secureStorage.saveString(
            key: USER_LEVEL, value: response.data!.user.role ?? 'Masyarakat');

        isValidationError(false);
        Snackbarmessage.instance.showSuccessSnackbar(
          title: 'Login berhasil',
          message: 'Selamat data di E-RTLH provinsi Jambi',
        );

        Get.offAllNamed(
          AppRoutes.HOME,
        );
      } else {
        Snackbarmessage.instance.showErrorSnackbar(
          title: 'Login Gagal',
          message: response.message ?? 'Username / Password salah',
        );
        isValidationError(true);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "Internal server error",
      ));
    }

    isLoading(false);
  }
}
