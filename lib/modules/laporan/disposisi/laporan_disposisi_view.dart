import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/primary_button.dart';
import '../../../data/model/user_model.dart';
import 'laporan_disposisi_controller.dart';

class LaporanDisposisiView extends StatelessWidget {
  LaporanDisposisiView({super.key});
  final laporanDisposisiController = Get.find<LaporanDisposisiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Disposisi Laporan",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: laporanDisposisiController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                selectStatus(),
                Obx(() => laporanDisposisiController.selectedStatus.value ==
                        'proses_survey'
                    ? selectSurveyor()
                    : SizedBox.shrink()),
                textAreaForm(
                    "Keterangan",
                    laporanDisposisiController.keteranganController,
                    TextInputType.text),
                const SizedBox(height: 20),
                Obx(() => laporanDisposisiController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButton(
                        btnColor: colorSecondary,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        textButton: "Simpan",
                        onPressed: () {
                          if (laporanDisposisiController.formKey.currentState
                                  ?.validate() ??
                              true) {
                            laporanDisposisiController.submit();
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textAreaForm(String label, TextEditingController textController,
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
            maxLines: 10,
            decoration:
                InputDecoration(hintText: label, hintStyle: hintTextStyle),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value != null && value.isEmpty) {
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

  Widget selectStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Status",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            style: textFormFieldStyle,
            decoration:
                InputDecoration(hintText: "Status", hintStyle: hintTextStyle),
            value: laporanDisposisiController.selectedStatus.value.isEmpty
                ? null
                : laporanDisposisiController.selectedStatus.value,
            items: const [
              DropdownMenuItem(
                value: 'ditolak',
                child: Text('Ditolak'),
              ),
              DropdownMenuItem(
                value: 'proses_survey',
                child: Text('Survey'),
              ),
            ],
            onChanged: (value) {
              laporanDisposisiController.setStatus(value!);
            },
            validator: (value) {
              if (value == null) {
                return 'Status tidak boleh kosong';
              } else {
                return null;
              }
            },
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget selectSurveyor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Surveyor",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(() {
          return DropdownButtonFormField<UserModel>(
            style: textFormFieldStyle,
            decoration:
                InputDecoration(hintText: "Surveyor", hintStyle: hintTextStyle),
            value: laporanDisposisiController.selectedSurveyor.value,
            items: laporanDisposisiController.surveyors.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: laporanDisposisiController.onSelectSurveyor,
            validator: (value) {
              if (laporanDisposisiController.selectedSurveyor.value == null) {
                return 'Surveyor tidak boleh kosong';
              } else {
                return null;
              }
            },
          );
        }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
