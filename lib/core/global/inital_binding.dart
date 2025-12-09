import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../services/api_client/base_service.dart';
import '../services/sercuce_storage/secure_storage_manager.dart';
import '../services/sercuce_storage/secure_storage_manager_ipml.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //base banding
    Get.lazyPut<FlutterSecureStorage>(() => const FlutterSecureStorage());
    Get.lazyPut<BaseService>(() => BaseService());
    Get.lazyPut<SecureStorageManager>(() =>
        SecureStorageManagerImplementation(Get.find<FlutterSecureStorage>()));

    //service binding
  }
}
