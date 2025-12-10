import 'package:e_rtlh_mobile/modules/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';

import '../core/global/inital_binding.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.SPLASHSCREEN,
        page: () => SplashScreenView(),
        bindings: [InitialBinding(), SplashscreenBinding()]),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginView(),
        bindings: [InitialBinding(), LoginBinding()]),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => RegisterView(),
        bindings: [InitialBinding(), RegisterBinding()]),
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomeView(),
        bindings: [InitialBinding(), HomeBinding()]),
    /*GetPage(
        name: AppRoutes.LOGIN,
        page: () => Login(),
        bindings: [InitialBinding(), LoginBinding()]),
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: () => Dashboard(),
        bindings: [InitialBinding(), DashboardBinding()]),
     GetPage(
        name: AppRoutes.HOME,
        page: () => Home(),
        bindings: [InitialBinding(), HomeBinding()]),*/
  ];
}
