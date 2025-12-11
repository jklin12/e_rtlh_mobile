import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
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
              ],
            )),
    );
  }
}
