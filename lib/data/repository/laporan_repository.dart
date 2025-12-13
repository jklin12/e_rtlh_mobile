import 'package:dio/dio.dart';
import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
import '../model/laporan_model.dart';
import '../model/laporan_submit_model.dart';

class LaporanRepository extends BaseService {
  Future<BaseModel<List<LaporanModel>>?> listLaporan(String token,String status,String startDate,String endDate) async {
    return await getRequest<List<LaporanModel>>(
        '/api/laporan?status=$status&start_date=$startDate&end_date=$endDate',
        (dataJson) => (dataJson as List)
            .map((e) => LaporanModel.fromJson(e))
            .toList()
            .cast<LaporanModel>(),
        token);
  }

  Future<BaseModel<LaporanModel>?> detailLaporan(
      String token, String laporanId) async {
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

  Future<BaseModel<Map<String, dynamic>>?> surveyLaporan(
      String token, String laporanId, FormData postVal) async {
    return await postRequest<Map<String, dynamic>>(
        '/api/laporan/$laporanId/update',
        postVal,
        (dataJson) => dataJson as Map<String, dynamic>,
        token);
  }

  Future<BaseModel<Map<String, dynamic>>?> disposisiLaporan(
      String token, String laporanId, FormData postVal) async {
    return await postRequest<Map<String, dynamic>>(
        '/api/laporan/$laporanId/disposisi',
        postVal,
        (dataJson) => dataJson as Map<String, dynamic>,
        token);
  }
}
