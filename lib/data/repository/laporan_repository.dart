import 'package:dio/dio.dart';
import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
import '../model/laporan_model.dart';
import '../model/laporan_submit_model.dart';

class LaporanRepository extends BaseService {
  Future<BaseModel<List<LaporanModel>>?> listLaporan(String token) async {
    return await getRequest<List<LaporanModel>>(
        '/api/laporan',
        (dataJson) => (dataJson as List)
            .map((e) => LaporanModel.fromJson(e))
            .toList()
            .cast<LaporanModel>(),
        token);
  }
  Future<BaseModel<LaporanModel>?> detailLaporan(String token,String laporanId) async {
    return await getRequest<LaporanModel>(
        '/api/laporan/$laporanId',
        (dataJson) => LaporanModel.fromJson(dataJson as Map<String, dynamic>),
        token);
  }

  Future<BaseModel<LaporanSubmitModel>?> submitLaporan(
      String token, FormData postVal) async {
    return await postRequest<LaporanSubmitModel>(
        '/api/laporan',
        postVal,
        (dataJson) =>
            LaporanSubmitModel.fromJson(dataJson as Map<String, dynamic>),
        token);
  }
  Future<BaseModel<LaporanSubmitModel>?> disposisiLaporan(
      String token, String laporanId,FormData postVal) async {
    return await postRequest<LaporanSubmitModel>(
        '/api/laporan/$laporanId/disposisi',
        postVal,
        (dataJson) =>
            LaporanSubmitModel.fromJson(dataJson as Map<String, dynamic>),
        token);
  }
}
