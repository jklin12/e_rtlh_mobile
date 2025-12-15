import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../core/utils/assetes.dart';
import '../core/utils/colors.dart';
import '../core/utils/styles.dart';
import '../core/widget/primary_button.dart';

class CoomingSoon extends StatelessWidget {
  const CoomingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IMG_MAINTENANCE),
              const SizedBox(height: 24),
              const Text(
                "COMING SOON",
                style: TextStyle(
                  color: colorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Fitur ini akan masih dalam pengembangan",
                style: contentStyle,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PrimaryButton(
                  btnColor: colorPrimary,
                  textColor: Colors.white,
                  textButton: "Kembali",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
