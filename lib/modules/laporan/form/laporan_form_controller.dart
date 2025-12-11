import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/ref_kota/district_model.dart';
import '../../../data/model/ref_kota/regency_model.dart';
import '../../../data/model/ref_kota/village_model.dart';
import '../../../data/repository/laporan_repository.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/repository/ref_kota_repository.dart';
import '../../../routes/app_routes.dart';

class LaporanFormController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();
  final kotaRepo = RefKotaRepository(Dio());

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final nomorUrutC = TextEditingController();
  final alamatC = TextEditingController();
  final namaKrtc = TextEditingController();
  final umurKrtc = TextEditingController();
  final jumlahAnggotaC = TextEditingController();
  final jumlahKeluargaC = TextEditingController();

  var selectedGender = ''.obs;

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  final picker = ImagePicker();
  Rx<File?> selectedPhoto = Rx<File?>(null);

  var kabupatenList = <RegencyModel>[].obs;
  var kecamatanList = <DistrictModel>[].obs;
  var desaList = <VillageModel>[].obs;

  /// Selected value
  var selectedKabupaten = Rx<RegencyModel?>(null);
  var selectedKecamatan = Rx<DistrictModel?>(null);
  var selectedDesa = Rx<VillageModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadKabupaten();
  }

  @override
  void onClose() {
    nomorUrutC.dispose();
    alamatC.dispose();
    namaKrtc.dispose();
    umurKrtc.dispose();
    jumlahAnggotaC.dispose();
    jumlahKeluargaC.dispose();
    super.onClose();
  }

  Future<void> loadKabupaten() async {
    kabupatenList.value = await kotaRepo.getKabupaten();
  }

  Future<void> loadKecamatan(String regencyId) async {
    kecamatanList.value = await kotaRepo.getKecamatan(regencyId);
  }

  Future<void> loadDesa(String districtId) async {
    desaList.value = await kotaRepo.getDesa(districtId);
  }

  void onSelectKabupaten(RegencyModel? value) {
    selectedKabupaten.value = value;

    // reset
    selectedKecamatan.value = null;
    selectedDesa.value = null;
    kecamatanList.clear();
    desaList.clear();

    if (value != null) {
      loadKecamatan(value.id);
    }
  }

  void onSelectKecamatan(DistrictModel? value) {
    selectedKecamatan.value = value;

    // reset
    selectedDesa.value = null;
    desaList.clear();

    if (value != null) {
      loadDesa(value.id);
    }
  }

  void onSelectDesa(VillageModel? value) {
    selectedDesa.value = value;
  }

  Future<void> pickPhoto() async {
    final XFile? file = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (file != null) {
      selectedPhoto.value = File(file.path);
    }
  }

  Future<void> submit() async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);
    isLoading(true);

    Map<String, dynamic> data = {
      "nomor_urut_rumah_tangga": nomorUrutC.text,
      "kabupaten": selectedKabupaten.value!.name,
      "kecamatan": selectedKecamatan.value!.name,
      "desa": selectedDesa.value!.name,
      "alamat": alamatC.text,
      "nama_kepala_rumah_tangga": namaKrtc.text,
      "jenis_kelamin_krt": selectedGender,
      "umur_krt": umurKrtc.text,
      "jumlah_anggota_rt": jumlahAnggotaC.text,
      "jumlah_keluarga": jumlahKeluargaC.text,
    };

    final formData = dio.FormData();

    // Add text field
    data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    final fileName =
        selectedPhoto.value!.path.split(Platform.pathSeparator).last;
    final multipart = await dio.MultipartFile.fromFile(
      selectedPhoto.value!.path,
      filename: fileName,
    );
    formData.files.add(MapEntry("photos[]", multipart));
    var response = await laporanRepository.submitLaporan(userToken!, formData);

    if (response!.status == 'success') {
      Snackbarmessage.instance.showSuccessSnackbar(
        title: 'Pelaporan Berhasil',
        message: response.message ??
            'Laporan sedang diproses, Mohon menunggu update selanjutnya',
      );

      Get.offAllNamed(
        AppRoutes.HOME,
      );
    } else {
      Snackbarmessage.instance.showErrorSnackbar(
        title: 'Error',
        message: response.message ?? 'Internal server error',
      );
    }

    isLoading(false);
  }
}
