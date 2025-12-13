import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/primary_button.dart';
import 'survey_controller.dart';

class SurveyView extends StatelessWidget {
  SurveyView({super.key});
  final surveyController = Get.find<SurveyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Survey Laporan",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: surveyController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textForm('Status Kesejahteraan', surveyController.statusKesejahteraanC,
                    TextInputType.text),
                textForm('Pendidikan Tertinggi', surveyController.pendidikanC,
                    TextInputType.text),
                takeImage("Foto Depan Rumah", surveyController.selectedPhoto1,
                    surveyController.photo1Error),
                takeImage("Foto Samping Rumah", surveyController.selectedPhoto2,
                    surveyController.photo2Error),
                Obx(() => surveyController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButton(
                        btnColor: colorSecondary,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        textButton: "Kirim Survey",
                        onPressed: () {
                          if (surveyController.formKey.currentState
                                  ?.validate() ??
                              true) {
                            surveyController.submit();
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textForm(String label, TextEditingController textController,
      TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
            controller: textController,
            style: textFormFieldStyle,
            keyboardType: inputType,
            decoration:
                InputDecoration(hintText: label, hintStyle: hintTextStyle),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label tidak boleh kosong';
              } else {
                return null;
              }
            }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget takeImage(String label, Rx<File?> path, Rx<String> photError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(() {
          return GestureDetector(
            onTap: () => surveyController.pickPhoto(path),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.grey.shade200,
              ),
              child: path.value == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Ambil Foto",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        path.value!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
          );
        }),
        Obx(() {
          return photError.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    photError.value,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
              : SizedBox.shrink();
        }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
