import 'package:get/get.dart';

import 'splash_screen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    //controller binding
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
