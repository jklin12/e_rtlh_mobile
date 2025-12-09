import 'package:e_rtlh_mobile/core/utils/assetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/colors.dart';
import 'login_controller.dart';
import 'widget/login_form.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginController = Get.find<LoginController>();

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
                  LoginForm(loginController: loginController),
                ],
              ),
            )));
  }
}
