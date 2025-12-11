import 'package:dio/dio.dart';
import 'package:e_rtlh_mobile/data/model/ref_kota/district_model.dart' show DistrictModel;
import 'package:e_rtlh_mobile/data/model/ref_kota/village_model.dart' show VillageModel;

import '../model/ref_kota/regency_model.dart';

class RefKotaRepository {
  final Dio dio;

  RefKotaRepository(this.dio);

  Future<List<RegencyModel>> getKabupaten() async {
    final response = await dio.get(
      'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/15.json',
    );

    final List data = response.data;

    return data.map((e) => RegencyModel.fromJson(e)).toList();
  }

  Future<List<DistrictModel>> getKecamatan(String regencyId) async {
    final response = await dio.get(
      'https://emsifa.github.io/api-wilayah-indonesia/api/districts/$regencyId.json',
    );

    final List data = response.data;

    return data.map((e) => DistrictModel.fromJson(e)).toList();
  }

  Future<List<VillageModel>> getDesa(String districtId) async {
    final response = await dio.get(
      'https://emsifa.github.io/api-wilayah-indonesia/api/villages/$districtId.json',
    );

    final List data = response.data;

    return data.map((e) => VillageModel.fromJson(e)).toList();
  }
}
