import 'package:e_rtlh_mobile/data/model/user_model.dart';
import 'package:e_rtlh_mobile/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/repository/laporan_repository.dart';
import 'package:dio/dio.dart' as dio;

import '../../../routes/app_routes.dart';

class LaporanDisposisiController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();
  final userRepository = Get.find<UserRepository>();

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final int laporanId = Get.arguments;

  var selectedStatus = ''.obs;
  var surveyors = <UserModel>[].obs;
  var selectedSurveyor = Rx<UserModel?>(null);
  final keteranganController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getSurveyor();
  }

  void setStatus(String status) {
    selectedStatus.value = status;
  }

  void onSelectSurveyor(UserModel? value) {
    selectedSurveyor.value = value;
  }

  Future<void> getSurveyor() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await userRepository.listSurveyor(userToken ?? '');
    if (response!.status == 'success') {
      surveyors.value = response.data!;
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'List sruveyor kosong',
      );
    }

    isLoading(false);
  }

  Future<void> submit() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);
    isLoading(true);

    Map<String, dynamic> data = {
      "keterangan": keteranganController.text,
      "status": selectedStatus,
      "surveyor_id":
          selectedSurveyor.value != null ? selectedSurveyor.value!.name : '-'
    };

    final formData = dio.FormData();

    // Add text field
    data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    var response = await laporanRepository.submitLaporan(userToken!, formData);

    if (response!.status == 'success') {
      Snackbarmessage.instance.showSuccessSnackbar(
        title: 'Disposisi Berhasil',
        message:
            response.message ?? 'Laporan akan segera disurvey oleh surveyor',
      );

      Get.offNamed(AppRoutes.LAPORAN_DETAIL, arguments: laporanId);
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Internal server error',
      );
    }
  }
}
