import 'package:e_rtlh_mobile/data/repository/laporan_repository.dart';
import 'package:get/get.dart';

import '../../../data/repository/master_lokasi_repository.dart';
import 'laporan_form_controller.dart';

class LaporanFormBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<LaporanRepository>(() => LaporanRepository());
    Get.lazyPut<MasterLokasiRepository>(() => MasterLokasiRepository());
    Get.lazyPut<LaporanFormController>(() => LaporanFormController());
  }
}
