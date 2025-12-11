import 'package:get/get.dart';

import '../../../data/repository/laporan_repository.dart';
import 'laporan_detail_controller.dart';
 
class LaporanDetailBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<LaporanRepository>(() => LaporanRepository());
    Get.lazyPut<LaporanDetailController>(() => LaporanDetailController());
  }
}