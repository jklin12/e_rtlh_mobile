import 'package:get/get.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/laporan_model.dart';
import '../../../data/repository/laporan_repository.dart';
import 'package:dio/dio.dart' as dio;

class LaporanDetailController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();

  var isLoading = true.obs;
  final int laporanId = Get.arguments;
  var laporanDetail = LaporanModel().obs;
  var role = ''.obs;

  @override
  void onInit() {
    super.onInit();

    getDetail();
  }

  Future<void> getDetail() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);
    var value = await secureStorage.getString(key: USER_LEVEL);
    role.value = value ?? 'masyarakat';

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

  Future<void> konfirmasiSurvey() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    Map<String, dynamic> data = {
      "keterangan": "Survey dikonfirmasi oleh admin",
      "status": "diverifikasi_admin",
    };

    final formData = dio.FormData();
    // Add text field
    data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    var response = await laporanRepository.disposisiLaporan(
        userToken!, "$laporanId", formData);

    if (response!.status == 'success') { 
      Snackbarmessage.instance.showSuccessSnackbar(
        title: 'Konfirmasi Berhasil',
        message: response.message ?? 'Laporan berhasil diupdate',
      );
      getDetail();
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Internal server error',
      );
    }

    isLoading(false);
  }
}
