import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/falvor_config.dart';
import '../../core/utils/assetes.dart';
import '../../core/utils/styles.dart';
import '../../routes/app_routes.dart';
import 'home_controller.dart';
import 'widget/banner_slider.dart';
import 'widget/menu_grid.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSolitude,
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          LOGO,
        ),
        title: Text("E-Damaja Jambi", style: titleStyle),
        /*actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: colorPrimary, size: 30),
            onPressed: () {
              Get.toNamed(AppRoutes.PROFILE);
            },
          ),
        ],*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.LAPORAN_FORM);
        },
        backgroundColor: colorPrimary,
        child: Icon(
          Icons.camera_alt,
          size: 28,
          color: Colors.white,
        ),
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    BannerSlider(
                      banners: homeController.home.value.banner,
                      baseUrl: "${FlavorConfig.baseUrl}/storage",
                    ),
                    // Tambahkan konten lainnya di sini
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Menu", style: subTitleStyle),
                    ),
                    MenuGrid(
                      menus: homeController.home.value.menus,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
