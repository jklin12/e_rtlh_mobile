import 'package:e_rtlh_mobile/modules/laporan/form/laporan_form_binding.dart';
import 'package:e_rtlh_mobile/modules/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';

import '../core/global/inital_binding.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/laporan/detail/laporan_detail_binding.dart';
import '../modules/laporan/detail/laporan_detail_view.dart';
import '../modules/laporan/disposisi/laporan_disposisi_binding.dart';
import '../modules/laporan/disposisi/laporan_disposisi_view.dart';
import '../modules/laporan/form/laporan_form_view.dart';
import '../modules/laporan/list/laporan_list_binding.dart';
import '../modules/laporan/list/laporan_list_view.dart';
import '../modules/laporan/sruvey/survey_binding.dart';
import '../modules/laporan/sruvey/survey_view.dart';
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
    GetPage(
        name: AppRoutes.LAPORAN_FORM,
        page: () => LaporanFormView(),
        bindings: [InitialBinding(), LaporanFormBinding()]),
    GetPage(
        name: AppRoutes.LAPORAN_LIST,
        page: () => LaporanListView(),
        bindings: [InitialBinding(), LaporanListBinding()]),
    GetPage(
        name: AppRoutes.LAPORAN_DETAIL,
        page: () => LaporanDetailView(),
        bindings: [InitialBinding(), LaporanDetailBinding()]),
    GetPage(
        name: AppRoutes.LAPORAN_DISPOSI,
        page: () => LaporanDisposisiView(),
        bindings: [InitialBinding(), LaporanDisposisiBinding()]),
    GetPage(
        name: AppRoutes.LAPORAN_SURVEY,
        page: () => SurveyView(),
        bindings: [InitialBinding(), SurveyBinding()]),
  ];
}
