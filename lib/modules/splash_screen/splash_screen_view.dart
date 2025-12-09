import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assetes.dart';
import 'splash_screen_controller.dart';

 
class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  final splashScreen = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: Image(
            image: AssetImage(LOGO),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
