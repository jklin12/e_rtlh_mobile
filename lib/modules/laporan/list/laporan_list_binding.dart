import 'package:get/get.dart';

import '../../../data/repository/laporan_repository.dart';
import 'laporan_list_controller.dart';

class LaporanListBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<LaporanRepository>(() => LaporanRepository());
    Get.lazyPut<LaporanListController>(() => LaporanListController());
  }
}