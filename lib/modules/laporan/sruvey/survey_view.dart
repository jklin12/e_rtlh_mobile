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
                textForm('Status Kesejahteraan',
                    surveyController.statusKesejahteraanC, TextInputType.text),
                textForm('Pendidikan Tertinggi', surveyController.pendidikanC,
                    TextInputType.text),
                textForm(
                  'Lapangan Usaha',
                  surveyController.lapanganUsahaC,
                  TextInputType.text,
                ),

                textForm(
                  'Status Kedudukan Pekerjaan',
                  surveyController.statusPekerjaanC,
                  TextInputType.text,
                ),

                const SizedBox(height: 16),

                // ===== FASILITAS RUMAH =====
                //sectionTitle('Kondisi Rumah'),

                dropdownField(
                  label: 'Menggunakan Tabung 5.5 Kg',
                  value: surveyController.menggunakanTabung55,
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Ya')),
                    DropdownMenuItem(value: '0', child: Text('Tidak')),
                  ],
                ),

                dropdownField(
                  label: 'Status Tabung Gas',
                  value: surveyController.statusTabungGas,
                  items: const [
                    DropdownMenuItem(value: 'Subsidi', child: Text('Subsidi')),
                    DropdownMenuItem(
                        value: 'Non Subsidi', child: Text('Non Subsidi')),
                  ],
                ),

                textForm(
                  'Status Bangunan',
                  surveyController.statusBangunanC,
                  TextInputType.text,
                ),

                dropdownField(
                  label: 'Jenis Lantai Terluas',
                  value: surveyController.jenisLantai,
                  items: const [
                    DropdownMenuItem(value: 'tanah', child: Text('Tanah')),
                    DropdownMenuItem(value: 'keramik', child: Text('Keramik')),
                    DropdownMenuItem(value: 'semen', child: Text('Semen')),
                  ],
                ),

                dropdownField(
                  label: 'Jenis Dinding Terluas',
                  value: surveyController.jenisDinding,
                  items: const [
                    DropdownMenuItem(value: 'triplek', child: Text('Triplek')),
                    DropdownMenuItem(value: 'tembok', child: Text('Tembok')),
                  ],
                ),

                dropdownField(
                  label: 'Jenis Atap Terluas',
                  value: surveyController.jenisAtap,
                  items: const [
                    DropdownMenuItem(value: 'seng', child: Text('Seng')),
                    DropdownMenuItem(value: 'genteng', child: Text('Genteng')),
                  ],
                ),

                const SizedBox(height: 16),

                // ===== RTLH =====
                //sectionTitle('Kondisi RTLH'),

                textForm(
                  'Kondisi RTLH',
                  surveyController.kondisiRtlhC,
                  TextInputType.text,
                ),

                textForm(
                  'Prioritas RTLH',
                  surveyController.prioritasRtlhC,
                  TextInputType.text,
                ),

                const SizedBox(height: 16),

                // ===== KELUARGA BERENCANA =====
                //sectionTitle('Keluarga Berencana'),

                textForm(
                  'Nomor Urut ART WUS',
                  surveyController.nomorArtWusC,
                  TextInputType.number,
                ),

                textForm(
                  'Usia Kawin Suami',
                  surveyController.usiaSuamiC,
                  TextInputType.number,
                ),

                textForm(
                  'Usia Kawin Istri',
                  surveyController.usiaIstriC,
                  TextInputType.number,
                ),

                dropdownField(
                  label: 'Peserta KB',
                  value: surveyController.pesertaKb,
                  items: const [
                    DropdownMenuItem(value: 'ya', child: Text('Ya')),
                    DropdownMenuItem(value: 'tidak', child: Text('Tidak')),
                  ],
                ),

                dropdownField(
                  label: 'Metode Kontrasepsi',
                  value: surveyController.metodeKontrasepsi,
                  items: const [
                    DropdownMenuItem(value: 'suntik', child: Text('Suntik')),
                    DropdownMenuItem(value: 'pil', child: Text('Pil')),
                    DropdownMenuItem(value: 'implant', child: Text('Implant')),
                  ],
                ),
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

  Widget sectionTitle(String title) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title, style: labelTitleStyle));
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

  Widget dropdownField({
    required String label,
    required RxString value,
    required List<DropdownMenuItem<String>> items,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: valueTextStyle,
              ),
              SizedBox(
                height: 8,
              ),
              DropdownButtonFormField<String>(
                value: value.value,
                items: items,
                 
                onChanged: (val) {
                  if (val != null) value.value = val;
                },
              ),
            ],
          )),
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
