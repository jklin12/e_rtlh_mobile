import 'package:e_rtlh_mobile/modules/home/home_controller.dart';
import 'package:get/get.dart';

import '../../data/repository/user_repository.dart';

 
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
