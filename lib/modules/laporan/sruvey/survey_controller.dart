import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/repository/laporan_repository.dart';
import 'package:dio/dio.dart' as dio;

class SurveyController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final int laporanId = Get.arguments;

  final statusKesejahteraanC = TextEditingController();
  final pendidikanC = TextEditingController();

  final picker = ImagePicker();
  Rx<File?> selectedPhoto1 = Rx<File?>(null);
  Rx<File?> selectedPhoto2 = Rx<File?>(null);
  Rx<File?> selectedPhoto3 = Rx<File?>(null);
  var photo1Error = "".obs;
  var photo2Error = "".obs;
  var photo3Error = "".obs;

  @override
  void onClose() {
    statusKesejahteraanC.dispose();
    pendidikanC.dispose();
    super.onClose();
  }

  Future<void> submit() async {
    if (!validateForm()) {
      return; // hentikan jika tidak valid
    }

    var userToken = await secureStorage.getString(key: USER_TOKEN);
    isLoading(true);

    Map<String, dynamic> data = {
      "status_kesejahteraan": pendidikanC.text,
      "pendidikan_tertinggi": pendidikanC.text
    };

    final formData = dio.FormData();

    // Add text field
    data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    final fileName1 =
        selectedPhoto1.value!.path.split(Platform.pathSeparator).last;
    final multipart1 = await dio.MultipartFile.fromFile(
      selectedPhoto1.value!.path,
      filename: fileName1,
    );
    formData.files.add(MapEntry("photos[0][file]", multipart1));
    formData.fields.add(MapEntry("photos[0][file]", "Foto Depan Rumah"));

    final fileName2 =
        selectedPhoto2.value!.path.split(Platform.pathSeparator).last;
    final multipart2 = await dio.MultipartFile.fromFile(
      selectedPhoto2.value!.path,
      filename: fileName2,
    );
    formData.files.add(MapEntry("photos[1][file]", multipart2));
    formData.fields.add(MapEntry("photos[1][file]", "Foto Samping Rumah"));

    var response = await laporanRepository.surveyLaporan(userToken!, "$laporanId",formData);

    if (response!.status == 'success') {
      Snackbarmessage.instance.showSuccessSnackbar(
        title: 'Survey Berhasil',
        message: response.message ?? 'Survey sudah diselesaikan',
      );
      Get.back(result: true);
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Internal server error',
      );
    }
    isLoading(false);

  }

  Future<void> pickPhoto(Rx<File?> path) async {
    final XFile? file = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (file != null) {
      path.value = File(file.path);
      photo1Error.value = "";
    }
  }

  bool validateForm() {
    if (selectedPhoto1.value == null) {
      photo1Error.value = "Foto wajib diambil!";
      return false;
    }
    if (selectedPhoto2.value == null) {
      photo2Error.value = "Foto wajib diambil!";
      return false;
    }
    if (selectedPhoto2.value == null) {
      photo2Error.value = "Foto wajib diambil!";
      return false;
    }
    return true;
  }
}
