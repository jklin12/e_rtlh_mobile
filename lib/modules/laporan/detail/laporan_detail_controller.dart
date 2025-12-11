import 'package:get/get.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/laporan_model.dart';
import '../../../data/repository/laporan_repository.dart';

class LaporanDetailController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();

  var isLoading = true.obs;
  final int laporanId = Get.arguments;
  var laporanDetail = LaporanModel().obs;

  @override
  void onInit() {
    super.onInit();
    getDetail();
  }

  Future<void> getDetail() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response =
        await laporanRepository.detailLaporan(userToken ?? '', "$laporanId");
    if (response!.status == 'success') {
      laporanDetail.value = response.data!;
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Detail laporan error',
      );
    }

    isLoading(false);
  }
}
