import 'package:e_rtlh_mobile/data/repository/laporan_repository.dart';
import 'package:e_rtlh_mobile/data/repository/user_repository.dart';
import 'package:e_rtlh_mobile/modules/laporan/disposisi/laporan_disposisi_controller.dart';
import 'package:get/get.dart';

 
class LaporanDisposisiBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<LaporanRepository>(() => LaporanRepository());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<LaporanDisposisiController>(() => LaporanDisposisiController());
  }
}
