import 'package:get/get.dart';

import '../../data/repository/user_repository.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
