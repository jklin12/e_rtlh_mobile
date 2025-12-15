import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart'; 
import '../detail/berita_detail_view.dart';
import 'berita_list_controller.dart';
import 'widget/berita_list_card.dart';

class BeritaListView extends StatelessWidget {
  BeritaListView({super.key});
  final beritListControlelr = Get.find<BeritaListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSolitude,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Berita Terbaru",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: Obx(() => beritListControlelr.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : beritListControlelr.listBerita.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () => beritListControlelr.getList(),
                  child: ListView.builder(
                    itemCount: beritListControlelr.listBerita.length,
                    itemBuilder: (context, index) {
                      final item = beritListControlelr.listBerita[index];

                      return BeritaListCard(
                        berita: item,
                        onTap: () {
                          Get.to(BeritaDetailView(beritaModel: item,));
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
