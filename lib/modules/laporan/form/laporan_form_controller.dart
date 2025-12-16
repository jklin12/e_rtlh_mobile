import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/services/location_service.dart';
import '../../../core/services/sercuce_storage/secure_storage_manager.dart';
import '../../../core/utils/preference_constant.dart';
import '../../../core/widget/snacbar_message.dart';
import '../../../data/model/ref_kota/district_model.dart';
import '../../../data/model/ref_kota/regency_model.dart';
import '../../../data/model/ref_kota/village_model.dart';
import '../../../data/repository/laporan_repository.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/repository/master_lokasi_repository.dart';
import '../../../routes/app_routes.dart';

class LaporanFormController extends GetxController {
  final secureStorage = Get.find<SecureStorageManager>();
  final laporanRepository = Get.find<LaporanRepository>();
  final locationRepository = Get.find<MasterLokasiRepository>();

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var photoError = "".obs;

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

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadKabupaten();
    getLocation();
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
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await locationRepository.getRegency(userToken!, "15");
    if (response!.status == 'success') {
      kabupatenList.value = response.data!;
    }
  }

  Future<void> loadKecamatan(String regencyId) async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await locationRepository.getDistrict(userToken!, regencyId);
    if (response!.status == 'success') {
      kecamatanList.value = response.data!;
    }
  }

  Future<void> loadDesa(String districtId) async {
    var userToken = await secureStorage.getString(key: USER_TOKEN);

    var response = await locationRepository.getVillage(userToken!, districtId);
    if (response!.status == 'success') {
      desaList.value = response.data!;
    }
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
      photoError.value = "";
    }
  }

  bool validateForm() {
    if (selectedPhoto.value == null) {
      photoError.value = "Foto wajib diambil!";
      return false;
    }
    return true;
  }

  Future<void> submit() async {
    if (!validateForm()) {
      return; // hentikan jika tidak valid
    }

    var userToken = await secureStorage.getString(key: USER_TOKEN);
    isLoading(true);

    Map<String, dynamic> data = {
      "nomor_urut_rumah_tangga": nomorUrutC.text,
      "kabupaten":
          selectedKabupaten.value != null ? selectedKabupaten.value!.name : '-',
      "kecamatan":
          selectedKecamatan.value != null ? selectedKecamatan.value!.name : '-',
      "desa": selectedDesa.value != null ? selectedDesa.value!.name : '-',
      "alamat": alamatC.text,
      "nama_kepala_rumah_tangga": namaKrtc.text,
      "jenis_kelamin_krt": selectedGender,
      "umur_krt": umurKrtc.text,
      "jumlah_anggota_rt": jumlahAnggotaC.text,
      "jumlah_keluarga": jumlahKeluargaC.text,
      "lat_lon": "${latitude.value},${longitude.value}",
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

  Future<void> getLocation() async {
    final position = await LocationService.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    print(latitude.value);
    print(longitude.value);
  }
}
