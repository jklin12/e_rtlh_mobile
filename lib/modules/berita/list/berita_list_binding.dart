import 'package:get/get.dart';

import '../../../data/repository/user_repository.dart';
import 'berita_list_controller.dart';

class BeritaListBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<BeritaListController>(() => BeritaListController());
  }
}
