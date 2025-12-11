import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/formater.dart';
import '../../../../core/utils/styles.dart';
import '../../../../data/model/laporan_history_model.dart';

class DetailHistory extends StatelessWidget {
  const DetailHistory({super.key, required this.histotry});
  final List<LaporanHistoryModel> histotry;

  Color getStatusColor(String status) {
    switch (status) {
      case "menunggu_verifikasi":
        return colorWarning;
      case "proses_survey":
        return colorSuccess;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "History Laporan",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: histotry.length,
          itemBuilder: (context, index) {
            final item = histotry[index];
            final bool isLast = index == histotry.length - 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // Bulatan
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: getStatusColor(item.status),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Garis di bawah kecuali item terakhir
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 60,
                        color: colorGreyFog,
                      ),
                  ],
                ),

                const SizedBox(width: 12),

                // ======== Content Card ========
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text(
                          (item.status).replaceAll("_", " ").toUpperCase(),
                          style: labelTitleStyle
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.keterangan,
                          style: contentStyle
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.person,
                                size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text(
                              item.creator?.name ?? "-",
                              style: contentStyle
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text(
                              convertToIndonesianFormatFromDateTime(item.createdAt!),
                              style: contentStyle
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
