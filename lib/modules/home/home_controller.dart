import 'package:e_rtlh_mobile/data/model/home_model.dart';
import 'package:get/get.dart';

import '../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../core/utils/preference_constant.dart';
import '../../data/repository/user_repository.dart';

class HomeController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final userRepository = Get.find<UserRepository>();

  var isLoading = true.obs;
  var home = HomeModel().obs;

  @override
  void onInit() {
    super.onInit();
    getHome();
  }

  Future<void> getHome() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await userRepository.home(userToken ?? '');
    if (response!.status == 'success') {
      home.value = response.data!;
    }

    isLoading(false);
  }
}
