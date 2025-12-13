import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../routes/app_routes.dart';
import 'laporan_list_controller.dart';
import 'widget/filter_modal.dart';
import 'widget/laporan_list_card.dart';

class LaporanListView extends StatelessWidget {
  LaporanListView({super.key});
  final laporanListController = Get.find<LaporanListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSolitude,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Riwayat Laporan",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                FilterModal.show(
                    context: context, controller: laporanListController);
              },
              icon: Icon(
                Icons.filter_alt,
                color: colorWhiteF3,
              ))
        ],
      ),
      body: Obx(() => laporanListController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : laporanListController.laporanList.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () => laporanListController.getList("", "", ""),
                  child: ListView.builder(
                    itemCount: laporanListController.laporanList.length,
                    itemBuilder: (context, index) {
                      final item = laporanListController.laporanList[index];

                      return LaporanListCard(
                        laporan: item,
                        onTap: () {
                          Get.toNamed(AppRoutes.LAPORAN_DETAIL,
                              arguments: item.laporanId);
                        },
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                  "Belum ada riwayat laporan",
                  style: requiredMarkStyle,
                ))),
    );
  }
}
