import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/styles.dart';
import '../../core/widget/primary_button.dart';
import 'register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Melengkung
            Container(
              height: 150,
              padding: const EdgeInsets.only(left: 20, top: 40),
              decoration: const BoxDecoration(
                color: colorGrey,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Daftar Akun E-RTLH",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Form Fields
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: registerController.formKey,
                child: Column(
                  children: [
                    _buildTextField("Name", "John Williams",
                        registerController.nameController),
                    _buildTextField(
                        "Email", "", registerController.emailController),
                    _buildTextField(
                        "Phone", "", registerController.phoneController),
                    _buildTextField(
                        "Password", "", registerController.passwordController,
                        isObscure: registerController.isSecureText.value),
                    _buildTextField("Confirm Password", "",
                        registerController.passwordConfirmController,
                        isObscure:
                            registerController.isSecureTextConfirm.value),
                    const SizedBox(height: 30),
                    Obx(
                      () => registerController.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : PrimaryButton(
                              btnColor: colorPrimary,
                              textColor: Colors.white,
                              textButton: "Daftar",
                              onPressed: () {
                                if (registerController.formKey.currentState
                                        ?.validate() ??
                                    true) {
                                  registerController.register();
                                }
                              }),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text.rich(
                          TextSpan(
                            text: "Sudah punya akun ? ",
                            style: unselectedMainMenuStyle,
                            children: [
                              TextSpan(text: "MASUK", style: labelTitleStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController textController,
      {bool isObscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        style: textFormFieldStyle,
        obscureText: isObscure,
        controller: textController,
        validator: (value) {
          if (value!.isEmpty) {
            return '$label tidak boleh kosong';
          } else {
            return null;
          }
        },
        decoration: isObscure
            ? passwordInputDecoration(
                togglePassword: () => registerController.tooglePassword(),
                obscurePassword: registerController.isSecureText.value,
                hintText: label,
              )
            : InputDecoration(hintText: label, hintStyle: hintTextStyle),
      ),
    );
  }
}
