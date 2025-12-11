import 'package:get/get.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/laporan_model.dart';
import '../../../data/repository/laporan_repository.dart';

class LaporanListController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();

  var isLoading = true.obs;
  var laporanList = <LaporanModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  Future<void> getList() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await laporanRepository.listLaporan(userToken ?? '');
    if (response!.status == 'success') {
      laporanList.value = response.data!;
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'List laporan',
      );
    }

    isLoading(false);
  }
}
