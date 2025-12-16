import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
import '../model/ref_kota/district_model.dart';
import '../model/ref_kota/regency_model.dart';
import '../model/ref_kota/village_model.dart';

class MasterLokasiRepository extends BaseService {
  // Fungsi untuk login

  Future<BaseModel<List<RegencyModel>>?> getRegency(
      String token, String provinceId) async {
    return await getRequest<List<RegencyModel>>(
        '/api/master/regency/$provinceId',
        (dataJson) => (dataJson as List)
            .map((e) => RegencyModel.fromJson(e))
            .toList()
            .cast<RegencyModel>(),
        token);
  }

  Future<BaseModel<List<DistrictModel>>?> getDistrict(
      String token, String regencyId) async {
    return await getRequest<List<DistrictModel>>(
        '/api/master/district/$regencyId',
        (dataJson) => (dataJson as List)
            .map((e) => DistrictModel.fromJson(e))
            .toList()
            .cast<DistrictModel>(),
        token);
  }

  Future<BaseModel<List<VillageModel>>?> getVillage(
      String token, String districtId) async {
    return await getRequest<List<VillageModel>>(
        '/api/master/village/$districtId',
        (dataJson) => (dataJson as List)
            .map((e) => VillageModel.fromJson(e))
            .toList()
            .cast<VillageModel>(),
        token);
  }
}
