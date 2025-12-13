import 'package:get/get.dart';

import '../../../data/repository/laporan_repository.dart';
import 'survey_controller.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<LaporanRepository>(() => LaporanRepository());
    Get.lazyPut<SurveyController>(() => SurveyController());
  }
}
