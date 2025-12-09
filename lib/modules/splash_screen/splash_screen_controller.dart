import 'package:get/get.dart';

import '../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../core/utils/preference_constant.dart';
import '../../routes/app_routes.dart';

class SplashscreenController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();

  @override
  void onInit() {
    super.onInit();
    //AnalyticsUtil.instance?.logAppOpen();
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLogin();
    });
  }

  Future<void> checkLogin() async {
    bool? token = await secureStorage.getBool(key: USER_LOGIN_STATUS);
    if (token != null && token) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN,
          arguments: {'is_has_back_button': false});
    }
  }
}
