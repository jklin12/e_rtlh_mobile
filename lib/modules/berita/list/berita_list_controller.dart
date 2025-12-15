
import 'package:get/get.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/berita_model.dart';
import '../../../data/repository/user_repository.dart';

class BeritaListController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final userRepository = Get.find<UserRepository>();

  var isLoading = true.obs;
  var listBerita = <BeritaModel>[].obs;

   @override
  void onInit() {
    super.onInit();
    getList();
  }

  Future<void> getList() async {
    isLoading(true);

    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await userRepository.getBerita(
        userToken ?? '');
    if (response!.status == 'success') {
      listBerita.value = response.data!;
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'List laporan',
      );
    }

    isLoading(false);
  }
}