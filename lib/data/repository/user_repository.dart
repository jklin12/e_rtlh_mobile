import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
import '../model/berita_model.dart';
import '../model/home_model.dart';
import '../model/user_model.dart';

class UserRepository extends BaseService {
  // Fungsi untuk login
  Future<BaseModel<HomeModel>?> home(String token) async {
    return await getRequest<HomeModel>(
        '/api/user/home',
        (dataJson) => HomeModel.fromJson(dataJson as Map<String, dynamic>),
        token);
  }

  Future<BaseModel<UserModel>?> profile(String token) async {
    return await getRequest<UserModel>(
        '/api/user/profile',
        (dataJson) => UserModel.fromJson(dataJson as Map<String, dynamic>),
        token);
  }

  Future<BaseModel<List<UserModel>>?> listSurveyor(String token) async {
    return await getRequest<List<UserModel>>(
        '/api/user/surveyor',
        (dataJson) => (dataJson as List)
            .map((e) => UserModel.fromJson(e))
            .toList()
            .cast<UserModel>(),
        token);
  }
  
  Future<BaseModel<List<BeritaModel>>?> getBerita(String token) async {
    return await getRequest<List<BeritaModel>>(
        '/api/user/berita',
        (dataJson) => (dataJson as List)
            .map((e) => BeritaModel.fromJson(e))
            .toList()
            .cast<BeritaModel>(),
        token);
  }

  Future<BaseModel<Map<String, dynamic>>?> logout(
    String token, 
  ) async {
    return await postRequest<Map<String, dynamic>>('/api/logout', {},
        (dataJson) => dataJson as Map<String, dynamic>, token);
  }
}
