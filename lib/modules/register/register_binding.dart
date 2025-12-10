import 'package:get/get.dart';

import '../../data/repository/auth_repository.dart';
import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
