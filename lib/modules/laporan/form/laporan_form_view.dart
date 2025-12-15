import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:e_rtlh_mobile/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/primary_button.dart';
import '../../../data/model/ref_kota/district_model.dart';
import '../../../data/model/ref_kota/regency_model.dart';
import '../../../data/model/ref_kota/village_model.dart';
import 'laporan_form_controller.dart';

class LaporanFormView extends StatelessWidget {
  LaporanFormView({super.key});
  final laporanFormController = Get.find<LaporanFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Laporn RTLH",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: laporanFormController.formKey,
            child: Column(
              children: [
                textForm("Nomor Rumah", laporanFormController.nomorUrutC,
                    TextInputType.text),
                /*selectKabupaten(),
                selectKecamatan(),
                selectDesa(),*/
                textForm("Alamat", laporanFormController.alamatC,
                    TextInputType.text),
                textForm("Nama Kepala Rumah Tangaa",
                    laporanFormController.namaKrtc, TextInputType.text),
                selectGeder(),
                textForm("Umur ", laporanFormController.umurKrtc,
                    TextInputType.number),
                textForm("Jumlah Anggota Keluarga ",
                    laporanFormController.jumlahAnggotaC, TextInputType.number),
                textForm(
                    "Jumlah Keluarga ",
                    laporanFormController.jumlahKeluargaC,
                    TextInputType.number),
                takeImage(),
                const SizedBox(height: 20),
                Obx(() => laporanFormController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButton(
                        btnColor: colorPrimary,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        textButton: "Lapor",
                        onPressed: () {
                          if (laporanFormController.formKey.currentState
                                  ?.validate() ??
                              true) {
                            laporanFormController.submit();
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
              if (value == null || value.isEmpty){
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

  Widget selectGeder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jenis Kelamin",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            style: textFormFieldStyle,
            decoration: InputDecoration(
                hintText: "jenis Kelamin", hintStyle: hintTextStyle),
            value: laporanFormController.selectedGender.value.isEmpty
                ? null
                : laporanFormController.selectedGender.value,
            items: const [
              DropdownMenuItem(
                value: 'laki-laki',
                child: Text('Laki-laki'),
              ),
              DropdownMenuItem(
                value: 'perempuan',
                child: Text('Perempuan'),
              ),
            ],
            onChanged: (value) {
              laporanFormController.setGender(value!);
            },
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget selectKabupaten() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kabupaten",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(() {
          return DropdownButtonFormField<RegencyModel>(
            style: textFormFieldStyle,
            decoration: InputDecoration(
                hintText: "Kabupaten", hintStyle: hintTextStyle),
            items: laporanFormController.kabupatenList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: laporanFormController.onSelectKabupaten,
            validator: (value) {
              if (value == null) {
                return 'Kabupaten tidak boleh kosong';
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

  Widget selectKecamatan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kecamatan",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(() {
          return DropdownButtonFormField<DistrictModel>(
            style: textFormFieldStyle,
            value: laporanFormController.selectedKecamatan.value,
            decoration: InputDecoration(
                labelText: "Kecamatan", hintStyle: hintTextStyle),
            items: laporanFormController.kecamatanList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Kecamatan tidak boleh kosong';
              } else {
                return null;
              }
            },
            onChanged: laporanFormController.kecamatanList.isEmpty
                ? null
                : laporanFormController.onSelectKecamatan,
          );
        }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget selectDesa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Desa",
          style: valueTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Obx(() {
          return DropdownButtonFormField<VillageModel>(
            style: textFormFieldStyle,
            value: laporanFormController.selectedDesa.value,
            decoration:
                InputDecoration(labelText: "Desa", hintStyle: hintTextStyle),
            items: laporanFormController.desaList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Desa tidak boleh kosong';
              } else {
                return null;
              }
            },
            onChanged: laporanFormController.desaList.isEmpty
                ? null
                : laporanFormController.onSelectDesa,
          );
        }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget takeImage() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Obx(() {
          return GestureDetector(
            onTap: () => laporanFormController.pickPhoto(),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.grey.shade200,
              ),
              child: laporanFormController.selectedPhoto.value == null
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
                        laporanFormController.selectedPhoto.value!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
          );
        }),
        Obx(() {
          return laporanFormController.photoError.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    laporanFormController.photoError.value,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
              : SizedBox.shrink();
        })
      ],
    );
  }
}
