import 'package:dio/dio.dart';
import 'package:get/get.dart' as xxget;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../config/falvor_config.dart';
import '../../global/base_model.dart'; 
import '../sercuce_storage/secure_storage_manager.dart';

class BaseService {
  final Dio _dio = Dio();
  final String baseUrl = FlavorConfig.baseUrl;

  final secureStorage = xxget.Get.find<SecureStorageManager>();

  Future<BaseModel<T>?> getRequest<T>(String endpoint,
      T Function(Object? json) fromJsonT, String? token) async {
    try {
      Response response = await _dio.get(
        '$baseUrl$endpoint',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );
      return BaseModel<T>.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      return BaseModel<T>(
        status: 'error',
        message: handleDioError(e),
        data: null,
      );
    } catch (e) {
      return BaseModel<T>(
        status: 'error',
        message: e.toString(),
        data: null,
      );
    }
  }

  // Request POST yang mengembalikan BaseModel<T>
  Future<BaseModel<T>?> postRequest<T>(String endpoint, dynamic data,
      T Function(Object? json) fromJsonT, String? token) async {
    try {
      Response response = await _dio.post(
        '$baseUrl$endpoint',
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );
      return BaseModel<T>.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      return BaseModel<T>(
        status: 'error',
        message: handleDioError(e),
        data: null,
      );
    } catch (e) {
      return BaseModel<T>(
        status: 'error',
        message: e.toString(),
        data: null,
      );
    }
  }

  // Request PUT yang mengembalikan BaseModel<T>
  Future<BaseModel<T>?> putRequest<T>(
      String endpoint,
      Map<String, dynamic> data,
      T Function(Object? json) fromJsonT,
      String? token) async {
    try {
      Response response = await _dio.put(
        '$baseUrl$endpoint',
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return BaseModel<T>.fromJson(response.data, fromJsonT);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Request DELETE yang mengembalikan BaseModel<T>
  Future<BaseModel<T>?> deleteRequest<T>(String endpoint,
      T Function(Object? json) fromJsonT, String? token) async {
    try {
      Response response = await _dio.delete(
        '$baseUrl$endpoint',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // Parse response data ke BaseModel<T>
      return BaseModel<T>.fromJson(response.data, fromJsonT);
    } catch (e) {
      return null;
    }
  }

  Future<String?> downloadRequest<T>(String endpoint, dynamic data,
      String filename, fromJsonT, String? token) async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = '${tempDir.path}/$filename';

      Response response = await _dio.download(
        '$baseUrl$endpoint',
        tempPath,
        queryParameters: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // Parse response data ke BaseModel<T>
      return tempPath;
    } on DioException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  String handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timeout";
    }
    if (e.type == DioExceptionType.sendTimeout) {
      return "Send timeout";
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return "Receive timeout";
    }

    if (e.type == DioExceptionType.badResponse) {
      try {
        print(e.response?.data);
        return e.response?.data['message'];
      } catch (_) {
        return "Bad response from server";
      }
    }

    if (e.type == DioExceptionType.connectionError) {
      return "No internet connection";
    }

    return "Unexpected error occurred";
  }
}
