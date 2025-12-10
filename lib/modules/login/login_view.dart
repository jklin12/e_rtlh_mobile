import 'package:e_rtlh_mobile/core/utils/assetes.dart';
import 'package:e_rtlh_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/primary_button.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.45;
    return Scaffold(
      backgroundColor: colorGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(LOGIN_BG),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      LOGO,
                      width: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Selamat Datang!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: loginController.formKey,
              child: Transform.translate(
                offset: const Offset(
                    0, -30), // Naikkan 30 piksel untuk membuat potongan
                child: Container(
                  // Menghitung tinggi container putih untuk menutupi sisa layar
                  // Tinggi total - Tinggi Header + Offset yang dinaikkan
                  height: screenHeight - headerHeight + 30,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), // Lengkungan di kiri atas
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                          controller: loginController.usernameController,
                          style: textFormFieldStyle,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Email", hintStyle: hintTextStyle),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Email wajib diisi';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextFormField(
                          style: textFormFieldStyle,
                          keyboardType: TextInputType.text,
                          obscureText: loginController.isSecureText.value,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Minimal 6 karakter';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          controller: loginController.passwordController,
                          decoration: passwordInputDecoration(
                            togglePassword: () =>
                                loginController.tooglePassword(),
                            obscurePassword: loginController.isSecureText.value,
                            hintText: "Password",
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(() => loginController.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : PrimaryButton(
                              btnColor: colorPrimary,
                              textColor: Colors.white,
                              textButton: "Masuk",
                              onPressed: () {
                                if (loginController.formKey.currentState
                                        ?.validate() ??
                                    true) {
                                  loginController.login();
                                }
                              })),
                      const SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.REGISTER);
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "Belum punya akun ? ",
                              style: unselectedMainMenuStyle,
                              children: [
                                TextSpan(
                                    text: "DAFTAR", style: labelTitleStyle),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
