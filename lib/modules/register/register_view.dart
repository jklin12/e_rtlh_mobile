import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assetes.dart';
import '../../core/utils/colors.dart';
import 'register_controller.dart';
import 'widget/register_form.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: gradientLogin),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Image(
                    image: AssetImage(LOGO),
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  RegisterFrom(registerController: registerController),
                ],
              ),
            )));
  }
}
