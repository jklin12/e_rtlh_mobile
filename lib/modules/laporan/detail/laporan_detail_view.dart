import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/confirmation_modal.dart';
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
        leading: IconButton(
            onPressed: () => Get.back(result: true),
            icon: Icon(Icons.arrow_back)),
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  DetailHeader(
                      laporanModel:
                          laporanDetailController.laporanDetail.value),
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
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: PrimaryButton(
                              btnColor: colorSecondary,
                              textColor: const Color.fromRGBO(255, 255, 255, 1),
                              textButton: "Disposisi",
                              onPressed: () async {
                                var result = await Get.toNamed(
                                    AppRoutes.LAPORAN_DISPOSI,
                                    arguments:
                                        laporanDetailController.laporanId);

                                if (result == true) {
                                  laporanDetailController
                                      .getDetail(); // refresh ulang data
                                }
                              }),
                        )
                      : SizedBox.shrink(),
                  laporanDetailController.role.value == 'surveyor' &&
                          laporanDetailController.laporanDetail.value.status ==
                              'proses_survey'
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: PrimaryButton(
                              btnColor: colorSecondary,
                              textColor: const Color.fromRGBO(255, 255, 255, 1),
                              textButton: "Survey Laporan",
                              onPressed: () async {
                                var result = await Get.toNamed(
                                    AppRoutes.LAPORAN_SURVEY,
                                    arguments:
                                        laporanDetailController.laporanId);

                                if (result == true) {
                                  laporanDetailController
                                      .getDetail(); // refresh ulang data
                                }
                              }),
                        )
                      : SizedBox.shrink(),
                  laporanDetailController.role.value == 'admin' &&
                          laporanDetailController.laporanDetail.value.status ==
                              'selesai_survey'
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: PrimaryButton(
                              btnColor: colorPrimary,
                              textColor: const Color.fromRGBO(255, 255, 255, 1),
                              textButton: "Konfirmasi Survey",
                              onPressed: () async {
                                ConfirmationModal.show(
                                    context: context,
                                    title: "Konfirmasi Survey",
                                    description:
                                        "Apakah anda yakin mengkonfirmasi survey dari ${laporanDetailController.laporanDetail.value.surveyor!.name} ?",
                                    confirmText: "Konfirmasi",
                                    cancelText: "Batal",
                                    onConfirm: () {
                                      laporanDetailController
                                          .konfirmasiSurvey();
                                    },
                                    confirmColor: colorPrimary);
                              }),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
    );
  }
}
