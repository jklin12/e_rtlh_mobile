import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/config/falvor_config.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widget/foto_preview_page.dart';
import '../../../../data/model/laporan_foto_model.dart';
import '../../../../data/model/laporan_history_model.dart';
import 'detail_history.dart';

class DetailFoto extends StatelessWidget {
  const DetailFoto(
      {super.key, required this.laporanFotoModel, required this.histotry});
  final List<LaporanFotoModel> laporanFotoModel;
  final List<LaporanHistoryModel> histotry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Foto laporan", style: subTitleStyle),
              historyIconButton()
            ],
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: laporanFotoModel.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // <<< 3 FOTO PER BARIS
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1, // kotak
            ),
            itemBuilder: (context, index) {
              final foto = laporanFotoModel[index];

              return GestureDetector(
                onTap: () {
                  Get.to(() => FotoPreviewPage(imageUrl: foto.path));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${FlavorConfig.baseUrl}/storage/${foto.path}",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget historyIconButton() {
    return InkWell(
      onTap: () => Get.to(DetailHistory(
        histotry: histotry,
      )),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorSecondary,
        ),
        child: Icon(
          Icons.history,
          size: 22,
          color: colorAccent3,
        ),
      ),
    );
  }
}
