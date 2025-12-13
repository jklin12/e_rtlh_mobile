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

  final selectedStatus = RxnString();

  // date range
  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final statuses = [
    'menunggu_verifikasi',
    'proses_survey',
    'selesai_survey',
    'diverifikasi_admin',
    'ditolak',
  ];

  void setStatus(String? value) {
    selectedStatus.value = value;
  }

  void setDateRange(DateTime start, DateTime end) {
    startDate.value = start;
    endDate.value = end;
  }

  void reset() {
    selectedStatus.value = null;
    startDate.value = null;
    endDate.value = null;
    getList("", "", "");
  }

  void getFilteredList() {
    getList(
        selectedStatus.value ?? '',
        startDate.value == null
            ? ''
            : startDate.value!.toIso8601String().split('T').first,
        endDate.value == null
            ? ''
            : endDate.value!.toIso8601String().split('T').first);
  }

  @override
  void onInit() {
    super.onInit();
    getFilteredList();
  }

  Future<void> getList(String status, String startDate, String endDate) async {
    isLoading(true);

    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await laporanRepository.listLaporan(
        userToken ?? '', status, startDate, endDate);
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
