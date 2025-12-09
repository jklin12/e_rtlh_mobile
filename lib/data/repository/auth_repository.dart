import 'package:e_rtlh_mobile/core/services/api_client/base_service.dart';

import '../../core/global/base_model.dart';
import '../model/login_model.dart';

class AuthRepository extends BaseService {
  // Fungsi untuk login
  Future<BaseModel<LoginModel>?> login(String username, String password) async {
    Map<String, dynamic> data = {
      'email': username,
      'password': password,
    };

    return await postRequest<LoginModel>(
        '/api/login',
        data,
        (dataJson) => LoginModel.fromJson(dataJson as Map<String, dynamic>),
        null);
  }

  Future<BaseModel<LoginModel>?> register(
      String email, String name, String phone, String password) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone
    };

    return await postRequest<LoginModel>(
        '/api/register',
        data,
        (dataJson) => LoginModel.fromJson(dataJson as Map<String, dynamic>),
        null);
  }
}
