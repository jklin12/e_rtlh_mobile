import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
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

  Future<BaseModel<List<UserModel>>?> listSurveyor(String token) async {
    return await getRequest<List<UserModel>>(
        '/api/user/surveyor',
        (dataJson) => (dataJson as List)
            .map((e) => UserModel.fromJson(e))
            .toList()
            .cast<UserModel>(),
        token);
  }
}
