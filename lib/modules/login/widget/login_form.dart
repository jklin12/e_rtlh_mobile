import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/assetes.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/regex.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/primary_button.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.loginController});

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Form(
          key: loginController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 600
                  ? MediaQuery.of(context).size.width / 2
                  : double.infinity,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Login", style: titleStyle),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => loginController.isValidationError.value
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            padding: const EdgeInsets.only(
                              top: 16,
                              right: 16,
                              bottom: 16,
                              left: 8,
                            ),
                            decoration: BoxDecoration(
                              color: colorRed.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ICON_WARNING),
                                const SizedBox(
                                  width: 8,
                                ),
                                 Text(
                                  loginController.errorMessage.value,
                                  style: TextStyle(
                                    color: colorRed,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()),
                    const Text(
                      "Email",
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: textFormFieldStyle,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(hintText: "Email"),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Username wajib diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: loginController.usernameController,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                    const SizedBox(
                      height: 16,
                    ),
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
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
