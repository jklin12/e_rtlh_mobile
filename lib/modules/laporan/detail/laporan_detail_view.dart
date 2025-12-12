import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/primary_button.dart';
import '../../../routes/app_routes.dart';
import 'laporan_detail_controller.dart';
import 'widget/detail_foto.dart';
import 'widget/detail_header.dart';

class LaporanDetailView extends StatelessWidget {
  LaporanDetailView({super.key});
  final laporanDetailController = Get.find<LaporanDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: colorSolitude,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Detail Laporan",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: Obx(() => laporanDetailController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                DetailHeader(
                    laporanModel: laporanDetailController.laporanDetail.value),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: colorSolitude,
                ),
                DetailFoto(
                  laporanFotoModel:
                      laporanDetailController.laporanDetail.value.foto!,
                  histotry:
                      laporanDetailController.laporanDetail.value.history!,
                ),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: colorSolitude,
                ),
                laporanDetailController.role.value == 'admin' &&
                        laporanDetailController.laporanDetail.value.status ==
                            'menunggu_verifikasi'
                    ? PrimaryButton(
                        btnColor: colorSecondary,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        textButton: "Disposisi",
                        onPressed: () => Get.toNamed(AppRoutes.LAPORAN_DISPOSI,
                            arguments: laporanDetailController.laporanId))
                    : SizedBox.shrink()
              ],
            )),
    );
  }
}
