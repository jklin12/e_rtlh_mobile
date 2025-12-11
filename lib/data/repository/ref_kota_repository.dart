import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:e_rtlh_mobile/data/model/ref_kota/district_model.dart';
import 'package:e_rtlh_mobile/data/model/ref_kota/village_model.dart';

import '../model/ref_kota/regency_model.dart';

class RefKotaRepository {
  final Dio dio;

  RefKotaRepository(this.dio) {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<List<RegencyModel>> getKabupaten() async {
    final response = await dio.get(
      'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/15.json',
    );

    final List data = response.data;

    return data.map((e) => RegencyModel.fromJson(e)).toList();
  }

  Future<List<DistrictModel>> getKecamatan(String regencyId) async {
    final response = await dio.get(
      'https://www.emsifa.com/api-wilayah-indonesia/api/districts/$regencyId.json',
    );

    final List data = response.data;

    return data.map((e) => DistrictModel.fromJson(e)).toList();
  }

  Future<List<VillageModel>> getDesa(String districtId) async {
    final response = await dio.get(
      'https://www.emsifa.com/api-wilayah-indonesia/api/villages/$districtId.json',
    );

    final List data = response.data;

    return data.map((e) => VillageModel.fromJson(e)).toList();
  }
}
